
BIN=malloc tc_malloc

all:$(BIN)

malloc:malloc.cc
	g++ -std=c++11 -o $@ $^
tc_malloc:malloc.cc
	g++ -DTC_MALLOC -std=c++11 -o $@ $^ -ltcmalloc
