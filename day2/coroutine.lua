-- 协同程序
local co =
  coroutine.create(
  function()
    print("hi")
  end
)
print(co)

print(coroutine.status(co)) --> suspended 挂起态
coroutine.resume(co) --> hi 运行态
print(coroutine.status(co)) --> dead 停止态

--yeild 可以将运行的函数挂起
co =
  coroutine.create(
  function()
    for i = 1, 10 do
      print("co " .. i)
      coroutine.yield()
    end
  end
)
print(coroutine.status(co)) --> suspended
coroutine.resume(co) --> co 1
print(coroutine.status(co)) --> suspended
coroutine.resume(co) --> co 2
coroutine.resume(co) --> co 3
coroutine.resume(co) --> co 4
coroutine.resume(co) --> co 5
coroutine.resume(co) --> co 6
coroutine.resume(co) --> co 7
coroutine.resume(co) --> co 8
coroutine.resume(co) --> co 9
coroutine.resume(co) --> co 10
print("-------------")
coroutine.resume(co) --> nothing
print(coroutine.resume(co)) -- false	cannot resume dead coroutine

-- 生产者-消费者问题
local newProductor

function productor()
  local i = 0
  while true do
    i = i + 1
    send(i) -- 将生产的物品发送给消费者
  end
end

function consumer()
  while true do
    local i = receive() -- 从生产者那里得到物品
    print(i)
  end
end

function receive()
  local status, value = coroutine.resume(newProductor)
  return value
end

function send(x)
  coroutine.yield(x) -- x表示需要发送的值，值返回以后，就挂起该协同程序
end

-- 启动程序
newProductor = coroutine.create(productor)
consumer()
