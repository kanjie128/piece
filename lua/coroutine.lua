
co = coroutine.create(
function(a, b ,c )
    print(a,b,c)
    return 1,2
end
    )

 co1 = coroutine.create(
 function(a , b , c)
     for i = 0, 1 do
         print(a,b,c)
         print("before", i)
         coroutine.yield()
         print("after", i)
     end
 end
 )
 
print(coroutine.resume(co1, 3,2,1))
print(coroutine.resume(co1, 4,5,6))
print(coroutine.resume(co1, 7,8,9))
print(coroutine.resume(co1, 7,8,9))
print(coroutine.resume(co1, 7,8,9))
print(coroutine.resume(co1, 7,8,9))
