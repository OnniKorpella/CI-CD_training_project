#!/bin/bash

# echo "hello"
# su - student
# echo "hello2"
# scp -i /usr/share/id_rsa.pub src/cat/s21_cat src/grep/s21_grep root@172.17.0.12:/usr/local/bin
# scp src/cat/s21_cat src/grep/s21_grep root@172.17.0.12:/usr/local/bin
sshpass -p '1'  scp src/cat/s21_cat src/grep/s21_grep root@172.17.0.12:/usr/local/bin
# echo "hello3"

# 
# expect {
# 	# "*fingerprint*" { send -- "yes\r" }
# 	"root@172.17.0.12's password:" { send -- "1" }
# }

# expect EOF
# scp ~/project/D06_nellyole_v2/src/cat/s21_cat.c student@172.17.0.12:/home/student/test
# scp ~/project/D06_nellyole_v2/src/cat/s21_cat.c root@172.17.0.12:/home/student/test
# scp src/cat/s21_cat src/grep/s21_grep student@172.17.0.12:/home/student/test
# scp src/cat/s21_cat src/grep/s21_grep student@172.24.116.8:/home/student/
# ssh student@172.24.116.8 "echo student | sudo -S mv s21_cat s21_grep /usr/local/bin/ | exit"



#!/usr/bin/expect -f
# set timeout -1
# spawn ./copy

# # expect "*password*" 
# expect "root@172.17.0.12's password:" 
# send -- "1\r" 
# expect EOF

#!/usr/bin/expect -f
# set timeout -1
# spawn ./questions
# expect "Hello, who are you?\r"
# send -- "Im Adam\r"
# expect "Can I ask you some questions?\r"
# send -- "Sure\r"
# expect "What is your favorite topic?\r"
# send -- "Technology\r"
# expect eof

