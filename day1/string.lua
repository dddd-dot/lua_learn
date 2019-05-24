local a = "hello world"
print(a)

-- 替換 产生新str，不改变原来的str
local b = string.gsub(a, "hello", "my")
print(a)
print(b)
