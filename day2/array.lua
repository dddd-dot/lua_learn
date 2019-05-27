-- 定义数组
-- 直接定义 local a = {1,2,3} 或者
local a = {} -- new array
for i = 1, 1000 do
  a[i] = i
end

-- lua 的数组 下标索引 默认从 1开始，而不是 0
print(a[0]) -- nil
print(a[1]) -- 1
print(#a) -- 1000

-- 即使通过如下，数组下标仍为 1 开始
local bad_arr = {}
for i = -5, 5 do
  bad_arr[i] = 0
end
--[[
  1	0
  2	0
  3	0
  4	0
  5	0
]]
for i, v in ipairs(bad_arr) do
  print(i, v)
end

-- 阵和 多维数组
function makeMT(N, M)
  local mt = {}
  for i = 1, N do
    mt[i] = {}
    for j = 1, M do
      mt[i][j] = 0
    end
  end
  return mt
end

local mt = makeMT(2, 3)
for i, v in ipairs(mt) do
  print(i, v)
end

local arr = {n = 10}
print(#arr) -- 0
print(arr["n"]) -- 10

local arr1 = {10}
print(#arr1) -- 1
print(arr1[1]) -- 10
