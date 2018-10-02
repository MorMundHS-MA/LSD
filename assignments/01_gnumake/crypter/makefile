all : encrypt decrypt runtest
clean :
	rm output/main.o output/crypto.o output/test.o output/encrypt output/decrypt output/test

runtest : test
	./output/test

main.o : main.c crypto.h
	cc -o output/main.o -c main.c

crypto.o : crypto.c crypto.h
	cc -o output/crypto.o -c crypto.c

test.o : test.c crypto.h
	cc -o output/test.o -c test.c

encrypt : main.o crypto.o
	cc -o output/encrypt output/main.o output/crypto.o

decrypt : main.o crypto.o
	cc -o output/decrypt output/main.o output/crypto.o

test : test.o crypto.o
	cc -o output/test output/test.o output/crypto.o