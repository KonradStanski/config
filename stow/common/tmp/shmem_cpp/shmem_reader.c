#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> // O_* constants
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include "shmem_common.h"

void print_hex(const void *data, size_t size) {
    const unsigned char *bytes = (const unsigned char *)data;
    for (size_t i = 0; i < size; i++) {
        printf("%02x ", bytes[i]);
        if ((i + 1) % 16 == 0) {
            printf("\n");
        }
    }
    if (size % 16 != 0) {
        printf("\n");
    }
}

int main(int argc, char *argv[]) {
    // Check if the --hex flag is provided
    int hex_mode = 0;
    if (argc > 1 && strcmp(argv[1], "--hex") == 0) {
        hex_mode = 1;
    }

    // Open shared memory
    int shm_fd = shm_open(SHM_NAME, O_RDONLY, 0666);
    if (shm_fd == -1) {
        perror("Failed to open shared memory");
        exit(1);
    }

    // Allocate size for the shared memory (MAX_ITEMS * Item size)
    size_t shm_size = MAX_ITEMS * sizeof(Item);

    // Map shared memory
    Item *items = mmap(0, shm_size, PROT_READ, MAP_SHARED, shm_fd, 0);
    if (items == MAP_FAILED) {
        perror("Failed to map shared memory");
        exit(1);
    }

    if (hex_mode) {
        // Print entire shared memory region as hex
        printf("Shared memory content in hex:\n");
        print_hex(items, shm_size);
    } else {
        // Read items from shared memory
        printf("Items in shared memory:\n");
        for (int i = 0; i < MAX_ITEMS; i++) {
            if (items[i].price != 0.0f) {
                printf("Item %d: Name: %s, Price: $%.2f\n", i + 1, items[i].name, items[i].price);
            }
        }
    }

    // Clean up
    munmap(items, shm_size);
    close(shm_fd);

    return 0;
}
