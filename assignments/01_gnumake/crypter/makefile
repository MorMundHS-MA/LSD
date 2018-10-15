all : output/encrypt output/decrypt runtest
clean :
	rm output/main.o output/crypto.o output/test.o output/encrypt output/decrypt output/test

runtest : output/test
	./output/test

output/main.o : main.c crypto.h
	cc -o output/main.o -c main.c

output/crypto.o : crypto.c crypto.h
	cc -o output/crypto.o -c crypto.c

output/test.o : test.c crypto.h
	cc -o output/test.o -c test.c

output/encrypt : output/main.o output/crypto.o
	cc -o output/encrypt output/main.o output/crypto.o

output/decrypt : output/main.o output/crypto.o
	cc -o output/decrypt output/main.o output/crypto.o

output/test : output/test.o output/crypto.o
	cc -o output/test output/test.o output/crypto.o