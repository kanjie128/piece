#include <stdlib.h>
#include <memory>
#include <list>

template<class T>
class ObjPool{
    public:
        using datatype = std::shared_ptr<T>;
        //typedef std::shared_ptr<T> datatype;
        template<class...Args>
        static datatype GetObj(Args&&...args) {
            if(pool.empty()){
                (void)dt_;//must be called after pool
                return datatype(new T(args...), SetObj);
            }
            datatype p = pool.front();
            pool.pop_front();
            return p;
        }
        static int PoolSize(){
            return pool.size();
        }

        struct destroyatexit{
            destroyatexit(){
                destroy_ = 0;
                printf("atexit\n");
                ::atexit(setdestroy);
            }
            ~destroyatexit(){
                //destroy_ = 1;
                printf("~atexit\n");
            }
        };
    private:
        static void SetObj(T* t){
            if(destroy_ == 1){
                printf("delete %x\n", t);
                delete t;
            } else{
                printf("push back %x\n", t);
                pool.push_back(datatype(t, SetObj));
            }
        }

        static void setdestroy(void){
            printf("setdestroy\n");
            destroy_ = 1;
        }


        static destroyatexit dt_;
        static int destroy_;
        static std::list<datatype> pool;
};

template<class T>
typename ObjPool<T>::destroyatexit ObjPool<T>::dt_;//must at last line

template<class T>
int ObjPool<T>::destroy_ = 0;

template<class T>
std::list<typename ObjPool<T>::datatype> ObjPool<T>::pool;
//std::list<std::shared_ptr<T>> ObjPool<T>::pool;

