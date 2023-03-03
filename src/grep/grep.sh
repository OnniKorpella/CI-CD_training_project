#!/bin/bash

file1=s21_grep.txt
file2=grep.txt

for var in "e" "-e "for"" "-i e" "-e 'A'" "-l e" "-c e" "-n e" "-v e"
do
  ./s21_grep $var s21_grep.c > $file1
  grep $var s21_grep.c > $file2
  
  diff $file1 $file2 > /dev/null 2>&1
  error=$?
  if [ $error -eq 1 ]
    then
    echo "Grep $var fail " >> ../../log
    # exit 1
    else
    echo "Grep $var passed "
  fi

done


# ./s21_grep e s21_grep.c > s21_grep.txt
# grep e s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -e "for" s21_grep.c > s21_grep.txt
# grep -e "for" s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -i e s21_grep.c > s21_grep.txt
# grep -i e s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -e 'A' s21_grep.c -e '[0-9]' > s21_grep.txt
# grep -e 'A' s21_grep.c -e '[0-9]' > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -l e s21_grep.c s21_grep.c s21_grep.c > s21_grep.txt
# grep -l e s21_grep.c s21_grep.c s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -c e s21_grep.c > s21_grep.txt
# grep -c e s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -n e s21_grep.c > s21_grep.txt
# grep -n e s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

# ./s21_grep -v e s21_grep.c > s21_grep.txt
# grep -v e s21_grep.c > grep.txt
# diff -s s21_grep.txt grep.txt
# rm s21_grep.txt grep.txt

