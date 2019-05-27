local a = "hello world"
print(a)

-- 替換 产生新str，不改变原来的str
local b = string.gsub(a, "hello", "my")
print(a)
print(b)

local poem = [[雨一直下

——我站在你的门前，请开门。
你使用人类的语言和我说话。]]

print(poem)
