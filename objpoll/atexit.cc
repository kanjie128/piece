#include <stdlib.h>
#include <stdio.h>

class a{
public:
    a(){
        printf("a\n");
    }
    ~a(){
        printf("~a\n");
    }

    struct b{
        b(){
            printf("ctr b\n");
        }
        ~b(){
            printf("dctr b\n");
        }
    };
    struct c{
        c(){
            printf("ctr c\n");
        }
        ~c(){
            printf("dctr c\n");
        }
    };

private:
    static b cb;
    static c cc;
};
a::b a::cb;
a::c a::cc;


//static a g_a;

void f(){
    printf("atexit\n");
}

int main(){
    printf("main\n");
    ::atexit(f);
}
