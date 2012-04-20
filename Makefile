CC = gcc
OS := $(shell uname)

all:
ifeq ($(OS), Darwin)
	$(CC) -o bin/brainfuck src/*
endif
ifeq ($(OS), Linux)
	$(CC) -o bin/brainfuck src/*
endif
ifeq ($(OS), CYGWIN_NT-5.1)
	$(CC) -c src/* -o bin/brainfuck
endif
no_interactive:
	ifeq ($(OS), Darwin)
		$(CC) -o src/brainfuck src/brainfuck.c
	endif
	ifeq ($(OS), Linux)
		$(CC) -o src/brainfuck src/brainfuck.c
	endif
	ifeq ($(OS), CYGWIN_NT-5.1)
		$(CC) -c src/brainfuck.c -o src/brainfuck
	endif
install:
	cp bin/brainfuck /usr/local/bin/brainfuck
ifeq ($(OS), Linux)
	cp man/brainfuck_linux.1 /usr/local/man/man1/brainfuck.1
endif
ifeq ($(OS), Darwin)
	cp man/brainfuck_darwin.1 /usr/local/man/man1/brainfuck.1
endif
clean:
	rm -f src/*.o
	rm -f bin/brainfuck

uninstall:
	rm -f /usr/local/bin/brainfuck
	rm -f /usr/local/man/man1/brainfuck.1