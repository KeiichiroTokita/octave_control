all: pd3 dist3 inert3

clean:
	-rm -f ./pd3
	-rm -f ./dist3
	-rm -f ./inert3
pd3: pd3.c
	gcc -Wall -O2 -o pd3 pd3.c /usr/lib/art_syscalls.o -lgpg3100 -lgpg3300

dist3: dist3.c
	gcc -Wall -O2 -o dist3 dist3.c /usr/lib/art_syscalls.o -lgpg3100 -lgpg3300

inert3: inert3.c
	gcc -Wall -O2 -o inert3 inert3.c /usr/lib/art_syscalls.o -lgpg3100 -lgpg3300
