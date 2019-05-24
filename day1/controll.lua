-- if
local num = 2
if 1 > num then
  print(1)
elseif 1 == num then
  print(2)
else
  print(3)
end

-- while
while 1 > 0 do
  print("while")
end

-- repeat
local repeatNum = 2
repeat
  print("repeat")
  repeatNum = repeatNum + 1
until repeatNum > 5

-- for, for将 exp3 作为step, 从exp1 到 exp2, exp3省略时，默认=1
--[[
  for var=exp1,exp2,exp3 do
    loop-part
  end
]]
function f(x)
  return x
end

-- 1 2 输出两个值 f函数 只run一次，并且在 循环前，执行
for i = 1, f(2) do
  print(i)
end
