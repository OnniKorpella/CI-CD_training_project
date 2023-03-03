#!/bin/bash
file1=s21_cat.txt
file2=cat.txt

for var in -b -e -v -n -s -t 
do
  ./s21_cat $var s21_cat.c > $file1
  cat $var s21_cat.c > $file2
  
  diff $file1 $file2 > /dev/null 2>&1
  error=$?
  if [ $error -eq 1 ]
    then
    echo "Cat $var fail " >> ../../log
    # exit 1
    else
    echo "Cat $var passed "
  fi

done
