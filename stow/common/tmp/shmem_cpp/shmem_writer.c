#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h> // O_* constants
#include <sys/mman.h>
#include <unistd.h>
#include <string.h>
#include "shmem_common.h"

int main() {
    // Open shared memory
    int shm_fd = shm_open(SHM_NAME, O_CREAT | O_RDWR, 0666);
    if (shm_fd == -1) {
        perror("Failed to open shared memory");
        exit(1);
    }

    // Allocate size for the shared memory (MAX_ITEMS * Item size)
    size_t shm_size = MAX_ITEMS * sizeof(Item);
    ftruncate(shm_fd, shm_size); // Set the size of the shared memory

    // Map shared memory
    Item *items = mmap(0, shm_size, PROT_READ | PROT_WRITE, MAP_SHARED, shm_fd, 0);
    if (items == MAP_FAILED) {perror("Failed to map shared memory");exit(1);}

    // Initialize shared memory slots with empty data
    for (int i = 0; i < MAX_ITEMS; i++) {
        if (items[i].price == 0.0f) {
            memset(items[i].name, 0, sizeof(items[i].name));
        }
    }

    // Read item data from user in a loop
    char input[MAX_NAME_LEN + 20]; // Name and price input buffer
    while (1) {
        printf("Enter item name and price (e.g., 'apple 1.23'), or press Enter to quit:\n");
        fgets(input, sizeof(input), stdin);

        // Check for empty line (quit condition)
        if (input[0] == '\n') {
            break;
        }

        // Parse input
        char name[MAX_NAME_LEN];
        float price;
        if (sscanf(input, "%s %f", name, &price) != 2) {
            printf("Invalid input. Please enter a name followed by a price.\n");
            continue;
        }

        // Find the first empty slot in shared memory
        int index = 0;
        while (index < MAX_ITEMS && items[index].price != 0.0f) {
            index++;
        }

        if (index == MAX_ITEMS) {
            printf("No more space in shared memory.\n");
            break;
        } else {
            // Store data in shared memory
            strncpy(items[index].name, name, MAX_NAME_LEN);
            items[index].price = price;
            printf("Item stored in shared memory: %s, $%.2f\n", name, price);
        }
    }

    // Clean up
    munmap(items, shm_size);
    close(shm_fd);

    return 0;
}
