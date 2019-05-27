function log(...)
  local arg = {...}
  for k, v in ipairs(arg) do
    print(k, v)
  end
end

log(1, 2, 3, 4, 5, 9)

-- 局部函数
local Attack = {
  fork = function()
    print("using a fork")
  end
}

Attack.woodenStick = function()
  print("using woodenStick")
end

function Attack.knife()
  print("using knife")
end

Attack.fork()
Attack.woodenStick()
Attack.knife()

-- 闭包
function Counter()
  local i = 0
  return function()
    i = i + 1
    return i
  end
end

local c1 = Counter()
local c2 = Counter()
print("c1 " .. c1())
print("c2 " .. c2())
print("c1 " .. c1())
print("c2 " .. c2())
print("c2 " .. c2())
