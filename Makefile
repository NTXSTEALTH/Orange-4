CC = gcc
CFLAGS = -Wall -Wextra -O2

test_objects: test_objects.o object.o
	$(CC) -o test_objects test_objects.o object.o -lcrypto

test_tree: test_tree.o object.o tree.o index.o
	$(CC) -o test_tree test_tree.o object.o tree.o index.o -lcrypto

pes: pes.c index.o object.o commit.o
	$(CC) $(CFLAGS) pes.c index.o object.o commit.o -o pes -lcrypto

object.o: object.c
	$(CC) $(CFLAGS) -c object.c -o object.o

tree.o: tree.c
	$(CC) $(CFLAGS) -c tree.c -o tree.o

index.o: index.c
	$(CC) $(CFLAGS) -c index.c -o index.o

commit.o: commit.c
	$(CC) $(CFLAGS) -c commit.c -o commit.o

test_objects.o: test_objects.c
	$(CC) $(CFLAGS) -c test_objects.c -o test_objects.o

test_tree.o: test_tree.c
	$(CC) $(CFLAGS) -c test_tree.c -o test_tree.o

clean:
	rm -f *.o test_objects test_tree pes
