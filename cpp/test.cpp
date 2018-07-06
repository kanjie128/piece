#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
#include <strings.h>
#include <signal.h>
#include <sys/resource.h>

void sig_handle(int sig){
    printf("recv sig:%d\n", sig);
}
int main(){
    struct sigaction s;
    bzero(&s, sizeof(s));
    s.sa_handler = sig_handle;
    sigemptyset(&s.sa_mask);
    s.sa_flags = 0;//SA_SIGINFO;
    sigaction(SIGABRT, &s, NULL);
    struct rlimit rl, rlim_new;
    int ret = getrlimit(RLIMIT_CORE, &rl);
    printf("getrlimit ret:%d cur:%d, max:%d\n", ret, rl.rlim_cur, rl.rlim_max);
    rlim_new.rlim_cur = rlim_new.rlim_max = RLIM_INFINITY;
    ret = setrlimit(RLIMIT_CORE, &rlim_new);
    if (ret!=0) {
        printf("setrlimit error %d\n", ret);
    }

    int z = 0;
    int d = 1/z;
 
    assert(1==0);

   return 0;
}
