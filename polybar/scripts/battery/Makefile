CC = gcc
CFLAGS = -std=c11 -pedantic -Wall -Wextra -O3
BINS = batterystatus
SOURCE = batterystatus.c
OBJS = batterystatus.o

.PHONY: all
all: batterystatus

batterystatus: $(OBJS)
		$(CC) $(CFLAGS) -o $@ $^

.PHONY: clean
clean:
		rm -rf *.o

%.o: %.c
		$(CC) $(CFLAGS) -c -o $@ $<
