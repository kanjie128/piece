#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <dlfcn.h>
#include <dirent.h>

int get_process_name(char* pid, char* buf);
