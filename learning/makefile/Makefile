CC = gcc
CFLAGS = -pthread
EXE = a.exe b.exe c.exe
all: $(EXE)

%.exe: %.o
	$(CC) $(CFLAGS) $< -o $@

%.o: %.c
	$(CC) -c $(CFLAGS) $< -o $@

