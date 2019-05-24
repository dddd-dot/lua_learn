--  数组 使用 {} 构造，跟其他语言的[], 不一样，并且 下标从 1开始，其他语言从 0 开始
local days = {
  "Sunday",
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday"
}
print(days[1]) -- Sunday

-- 初始化表 {}, 与js或者py都不一样，里面的元素使用 = 赋值
local dict = {
  name = "xbuding",
  gender = "boy"
}

print(dict.name .. "--" .. dict.gender)

local w = {x = 0, y = 0, label = "console"}
local x = {math.sin(0), math.sin(1), math.sin(2)}

-- for i, v in ipairs(x) do
--   print(i .. "--" .. v)
-- end

w[1] = "hello world"
x.f = w

-- print(x.f[1])
-- print(w["x"])
w["x"] = nil
print(w["x"])

for k, v in pairs(w) do
  print(k .. "---" .. v)
end
