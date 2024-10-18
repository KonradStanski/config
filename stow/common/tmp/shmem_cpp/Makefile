CC = gcc
CFLAGS = -Wall

# List of programs
PROGRAMS = shmem_reader shmem_writer
HEADERS = shared.h

# Default target
all: $(PROGRAMS)

# Generic rule for compiling .c files into .o files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $<

# Clean target to remove compiled files
clean:
	rm -f *.o $(PROGRAMS)
