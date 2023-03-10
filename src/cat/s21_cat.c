// Created by Nellyole  6.12.22.
#include <getopt.h>
#include <stdio.h>
#include <string.h>

typedef struct {
  int b;
  int e;
  int v;
  int n;
  int s;
  int t;
} flags;

int parser(int argc, char *argv[], flags *flg);
int reader(char *argv[], flags *flg);

int main(int argc, char *argv[]) {
  flags flg = {0};
  int exit = 0;
  exit = parser(argc, argv, &flg);

  while (optind < argc) {
    exit = reader(argv, &flg);
    optind++;
  }

  return exit;
}

int parser(int argc, char *argv[], flags *flg) {
  int exit = 0;
  int calculate;
  int index = 0;
  static struct option long_option[] = {
      {"number-nonblank", 0, 0, 'b'},
      {"number", 0, 0, 'n'},
      {"squeeze-blank", 0, 0, 's'},
      {0, 0, 0, 0},
  };
  while ((calculate = getopt_long(argc, argv, "+bEnsTvet", long_option,
                                  &index)) != -1) {
    switch (calculate) {
      case 'b':
        flg->b = 1;
        break;
      case 'n':
        flg->n = 1;
        break;
      case 's':
        flg->s = 1;
        break;
      case 'e':
        flg->e = 1;
        flg->v = 1;
        break;
      case 't':
        flg->t = 1;
        flg->v = 1;
        break;
      case 'v':
        flg->v = 1;
        break;
      case 'E':
        flg->e = 1;
        break;
      case 'T':
        flg->t = 1;
        break;
      default:
        fprintf(stderr, "usage: cat [-benstuv] [ptr ...]");
        exit = 1;
        break;
    }
  }
  return exit;
}

int reader(char *argv[], flags *flg) {
  FILE *ptr;
  int exit = 0;

  ptr = fopen(argv[optind], "r");

  if (ptr != NULL) {
    int calculate = 1;
    int empty = 0;
    int prev = '\n';
    int now;

    while ((now = fgetc(ptr)) != EOF) {
      if (flg->b && flg->n) {
        flg->n = 0;
      }
      if (flg->s && now == '\n' && prev == '\n') {
        empty++;
        if (empty > 1) {
          continue;
        }
      } else {
        empty = 0;
      }
      if (flg->n && prev == '\n') {
        printf("%6d\t", calculate++);
        // printf("%6d\n", calculate++); //<---------------------
      }
      if (flg->b && now != '\n' && prev == '\n') {
        printf("%6d\t", calculate++);
      }
      if (flg->t && now == '\t') {
        printf("^");
        now = 'I';
      }
      if (flg->e && now == '\n') {
        printf("$");
      }
      if (flg->v) {
        if ((now >= 0 && now < 9) || (now > 10 && now < 32) || now == 127) {
          if (now == 127) {
            printf("^?");
            prev = now;
            continue;
          } else {
            printf("^");
            now += 64;
          }
        }
      }
      printf("%c", now);
      prev = now;
    }
    fclose(ptr);
  } else {
    exit = -1;
  }
  return exit;
}
