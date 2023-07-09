#pragma once

typedef struct {
    int number;
    char *name;
    char *abbr;
} AKJV_book;

typedef struct {
    int book;
    int chapter;
    int verse;
    char *text;
} AKJV_verse;

extern AKJV_verse AKJV_verses[];

extern int AKJV_verses_length;

extern AKJV_book AKJV_books[];

extern int AKJV_books_length;
