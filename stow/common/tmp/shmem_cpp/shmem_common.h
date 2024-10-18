#pragma once

#define SHM_NAME "/shm_example"
#define MAX_NAME_LEN 8
#define MAX_ITEMS 10

// Structure for an item with a name and price
typedef struct {
    char name[MAX_NAME_LEN];
    float price;
} Item;
