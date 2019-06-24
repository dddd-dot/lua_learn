local Gamepanel = {}
local map = {}

local Position = {}
Position.__index = Position
function Position:new(row, column, obj)
  local o = {}
  setmetatable(o, Pox)
  assert(row)
  assert(column)
  assert(obj)
  o.row = row
  o.column = column
  o.obj = obj
  -- 1=hide 2=show 3=dead
  o.status = 1
  return o
end

function Position:checkShow()
  if self.status == 1 then
    error("棋子状态不正确")
  end
end

local Animal = {}
Animal.__index = Animal
function Animal:new(level, belong)
  local o = {}
  setmetatable(o, Animal)
  assert(level)
  assert(belong)
  o.level = level
  o.belong = belong
  return o
end
