OBJS = src/AKJV_main.o \
       src/AKJV_match.o \
       src/AKJV_ref.o \
       src/AKJV_render.o \
       src/intset.o \
       src/strutil.o \
       data/AKJV_data.o
CFLAGS += -Wall -Isrc/
LDLIBS += -lreadline

AKJV: $(OBJS)
	$(CC) -o $@ $(LDFLAGS) $(OBJS) $(LDLIBS)

src/AKJV_main.o: src/AKJV_main.c src/AKJV_config.h src/AKJV_data.h src/AKJV_match.h src/AKJV_ref.h src/AKJV_render.h src/strutil.h

src/AKJV_match.o: src/AKJV_match.h src/AKJV_match.c src/AKJV_config.h src/AKJV_data.h src/AKJV_ref.h

src/AKJV_ref.o: src/AKJV_ref.h src/AKJV_ref.c src/intset.h src/AKJV_data.h

src/AKJV_render.o: src/AKJV_render.h src/AKJV_render.c src/AKJV_config.h src/AKJV_data.h src/AKJV_match.h src/AKJV_ref.h

src/insetset.o: src/intset.h src/insetset.c

src/strutil.o: src/strutil.h src/strutil.c

data/AKJV_data.o: src/AKJV_data.h data/AKJV_data.c

data/AKJV_data.c: data/AKJV.tsv data/generate.awk src/AKJV_data.h
	awk -f data/generate.awk $< > $@

.PHONY: clean
clean:
	rm -rf $(OBJS) AKJV
