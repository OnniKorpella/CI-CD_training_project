CC = gcc
FLAG = -Wall -Wextra -Werror -std=c11 #-D_GNU_SOURCE

all: clean s21_cat test

clean:
	rm -rf *.o *.out s21_cat *.txt *.cfg .clang-format log

s21_cat: s21_cat.c
	$(CC) $(FLAG) s21_cat.c -o s21_cat 

test: s21_cat
	sh cat.sh

check:
	cp ./../../materials/linters/.clang-format .clang-format
	clang-format -n s21_cat.c 
	rm -rf ./*.clang-format 

