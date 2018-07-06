#include "stdio.h"
#include "objpool.h"

class foo : public ObjPool<foo>{
    public:
        foo(int i):d(i){}
        ~foo(){
            printf("~foo\n");
        }
        void print(){
            printf("d: %d\n", d);
        }
    private:
        int d;
};

int main(){
    {
    auto f = foo::GetObj(123);
    printf("get obj(0x%x) from poll\n", f.get());
    f->print();
    }
    printf("poolsize:%d\n", foo::PoolSize());
    getchar();

    return 0;
}
