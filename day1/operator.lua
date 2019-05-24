--[[
  运算符优先级
  ^
  not - (unary)
  *  /
  +  -
  ..
  <  >  <= >= ~= ==
  and
  or
]]
-- 关系运算符
print("0" == 0)
-- 不允许用 number和string比较，比js正常的玩意
print(2 < "15")

--[[lua的逻辑判断 只有 false 和 nil 是假， 其他都为真，0 也是true (excuseme?)
and 和 or，跟 python的也不一样，不是 返回结果 Ture 或者 False，而是关键词两边的值
]]
print(4 or 5) -- res=4
print(4 and 5) -- res=5
-- a or b, 如果a=true，则返回 a，否则返回b。 a and b 如果a=true，返回b，否则返回a (跟各大语言的常规操作不一样)

-- 三元运算符
-- 正常的逻辑 a ? b : c ; but lua-> (a and b) or c      !!!!! 相当的反人类
print((1 and 2) or 3)

-- not 非 返回 false 或者 true
print(not 1) -- false
print(not 0) -- false
print(not true) -- false
print(not false) -- true
print(not nil) -- true

-- 连接运算符 -> .., 如果操作对象是 数字，lua会将其转为 字符串，再操作
print("My name is " .. "xbuding")
print(1 .. 0 .. 2 .. 4)

-- 除了 ^ 和 .. 外，所有二元运算符都是做链接·
--[[
  a+i < b/2+1  <-->  (a+i) < ((b/2)+1)
  5+x^2*8  <-->  5+((x^2)*8)
  a < y and y <= z <-->  (a < y) and (y <= z)
  -x^2  <-->  -(x^2)
  x^y^z <-->  x^(y^z)
]]
