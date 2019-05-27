--[[
  setmetatable(table,metatable): 对指定 table 设置元表(metatable)，如果元表(metatable)中存在 __metatable 键值，setmetatable 会失败。
  getmetatable(table): 返回对象的元表(metatable)。
]]
-- __index 元方法
local fruid = {
  color = "green"
}
local apple = {
  shape = "square"
}

local nzlApple =
  setmetatable(
  apple,
  {
    __index = fruid
  }
)

print(nzlApple.color)
print(nzlApple.shape)

--[[
  总结
  Lua 查找一个表元素时的规则，其实就是如下 3 个步骤:

  1.在表中查找，如果找到，返回该元素，找不到则继续
  2.判断该表是否有元表，如果没有元表，返回 nil，有元表则继续。
  3.判断元表有没有 __index 方法，如果 __index 方法为 nil，则返回 nil；如果 __index 方法是一个表，则重复 1、2、3；如果 __index 方法是一个函数，则返回该函数的返回值。
]]
-- __newindex 元方法

mymetatable = {}
mytable = setmetatable({key1 = "value1"}, {__newindex = mymetatable})

print(mytable.key1)

mytable.newkey = "新值2"
print(mytable.newkey, mymetatable.newkey)

mytable.key1 = "新值1"
print(mytable.key1, mymetatable.key1)
--[[
  以上实例中表设置了元方法 __newindex，在对新索引键（newkey）赋值时（mytable.newkey = "新值2"），会调用元方法，而不进行赋值。而如果对已存在的索引键（key1），则会进行赋值，而不调用元方法 __newindex。
]]
-- 为表添加操作符
local tb1 =
  setmetatable(
  {1, 2, 3},
  {
    __add = function(oldTable, newTable)
      for i, v in ipairs(oldTable) do
        oldTable[i] = v + (newTable[i] or 0)
      end
      return oldTable
    end,
    __call = function()
      print("You call me")
    end,
    __tostring = function()
      return "It just a stirng, hell."
    end
  }
)

local tb2 = {1, 5}
tb1 = tb1 + tb2
--[[
  1	2
  2	7
  3	3
]]
for i, v in ipairs(tb1) do
  print(i, v)
end
print(tb1()) -- You call me
print(tb1) -- It just a stirng, hell.
--[[
  模式	描述
  __add	对应的运算符 '+'.
  __sub	对应的运算符 '-'.
  __mul	对应的运算符 '*'.
  __div	对应的运算符 '/'.
  __mod	对应的运算符 '%'.
  __unm	对应的运算符 '-'.
  __concat	对应的运算符 '..'.
  __eq	对应的运算符 '=='.
  __lt	对应的运算符 '<'.
  __le	对应的运算符 '<='.

  ----------------------------------
  __call 元方法在 Lua 调用一个值时调用
  __tostring 元方法用于修改表的输出行为
]]
