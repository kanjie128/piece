#include <stdlib.h>
#include <stdio.h>
#include <sys/time.h>
#include <stdint.h>
#include <list>
#include <memory>
#ifdef TC_MALLOC
#include <gperftools/heap-profiler.h>
#include <gperftools/malloc_extension.h>
#endif

#define MICRO_SEC 1000000 
#define MILLI_SEC 1000

class MallocItem;
typedef std::shared_ptr<MallocItem> MallocItemPtr;
using MallocPtrMap = std::list<MallocItemPtr>;

uint64_t timediff(struct timeval *s, struct timeval *e)
{
    return 1000000*(e->tv_sec-s->tv_sec) + e->tv_usec - s->tv_usec;
}


class MallocItem{
public:
     MallocItem(char* p=NULL):data(p){}
     ~MallocItem()
     {
        //printf("free\n");
        ::free(data);
     }
     static  MallocItemPtr makeItem(char * p = NULL)
     {
        return std::make_shared<MallocItem>(p);
     }

private:
    char *data;
};

int main(int argc, char*argv[])
{
#ifdef TC_MALLOC
    MallocExtension::Initialize();
#endif
    const int kLen = argc > 1 ? atoi(argv[1]) : 1024;
    const int kTimes = argc > 2 ? atoi(argv[2]) : 1000;
    printf("kLen:%d, kTimes:%d\n", kLen, kTimes);

    const int loop = 10000;
    struct timeval start, end;
    gettimeofday(&start, NULL);
    for(int t=0; t < loop; t++){
    {
        MallocPtrMap items;
        for(int i = 1;i<kTimes;i++)
        {
            //MallocItemPtr ptr(::new MallocItem(static_cast<char*>(::malloc(i*1024))));
            MallocItemPtr ptr(MallocItem::makeItem(static_cast<char*>(::malloc(kLen*i))));
            items.push_back(ptr);
        }
    }
    }
    gettimeofday(&end, NULL);
    printf("average time (%lf)ms\n", (timediff(&start, &end)*1.0)/(loop*1000));
    getchar();

#ifdef TC_MALLOC
    char buf[8192] = {0};
    MallocExtension::instance()->GetStats(buf, sizeof buf);
    printf("%s\n", buf);
    HeapProfilerDump("End");
#endif
    return 0;
}

