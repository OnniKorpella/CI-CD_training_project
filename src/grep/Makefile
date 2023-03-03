CC = gcc
FLAG = -Wall -Wextra -Werror -std=c11 -D_GNU_SOURCE

all: clean s21_grep test

clean:
	rm -rf *.o *.out s21_grep *.txt .clang-format log

s21_grep: s21_grep.c
	$(CC) $(FLAG) s21_grep.c -o s21_grep 

test: s21_grep
	sh grep.sh

check:
	cp ./../../materials/linters/.clang-format .clang-format
	clang-format -n s21_grep.c
	rm -rf ./*.clang-format 

