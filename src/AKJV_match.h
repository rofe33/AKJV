#pragma once

#include "AKJV_config.h"
#include "AKJV_ref.h"

typedef struct {
    int start;
    int end;
} AKJV_range;

typedef struct {
    int current;
    int next_match;
    AKJV_range matches[2];
} AKJV_next_data;

int
AKJV_next_verse(const AKJV_ref *ref, const AKJV_config *config, AKJV_next_data *next);
