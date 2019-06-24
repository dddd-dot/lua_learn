local map = {}

Pox = {}
Pox.__index = Pox
function Pox:new(row, column, obj)
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

function Pox:checkShow()
  if self.status == 1 then
    error("棋子状态不正确")
  end
end

Animal = {}
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

local animalArr = {}

local function createAccountAnimal(team)
  for i = 1, 8 do
    table.insert(animalArr, Animal:new(i, team))
  end
end

local team = {1, 2}
for _, v in pairs(team) do
  createAccountAnimal(v)
end

math.randomseed(os.time())
for i = 1, 4 do
  map[i] = {}
  for j = 1, 4 do
    local obj = table.remove(animalArr, math.random(1, #animalArr))
    map[i][j] = Pox:new(i, j, obj)
  end
end

local function printMap()
  for _, v in pairs(map) do
    local str = ""
    for _, sv in pairs(v) do
      if sv.obj then
        str = str .. sv.obj.belong .. "-" .. sv.obj.level .. "-" .. sv.status .. "   "
      else
        str = str .. " - " .. "-" .. sv.status .. "   "
      end
    end
    print(str)
  end
  print()
end

local function checkGame()
  local aliveTeam = {}
  for _, v in pairs(map) do
    for _, sv in pairs(v) do
      if sv.status == 2 then
        if #aliveTeam < 2 then
          aliveTeam[sv.obj.belong] = 0
        else
          break
        end
      end
    end
  end
  if #aliveTeam == 1 then
    local winner = ""
    for _, v in pairs(team) do
      if aliveTeam[team] then
        winner = aliveTeam[team]
        break
      end
    end
    error("游戏结束，赢家是 " .. winner)
  elseif #aliveTeam == 0 then
    error("游戏不正常结束")
  end
end

-- 决策 移动 还是 战斗
local function judge(before, next)
  if next.status == 2 then -- 决斗
    if next.obj.belong == before.obj.belong then
      error("自己人不允许决斗")
    end
    if before.obj.level > next.obj.level then
      next.obj = before.obj
      before.obj = nil
      before.status = 3
    else
      error("对方的等级比你大，不允许吃")
    end
  elseif next.status == 3 then -- 移动
    next.obj = before.obj
    next.status = 2
    before.obj = nil
    before.status = 3
  end
  printMap()
  checkGame()
end

-- 移动 1=up 2=left 3=down 4=right
local function move(pox, direction)
  -- TODO 是否允许，移动
  local next
  if direction == 1 then
    if pox.row == 1 then
      error("不允许向上移动")
    end
    next = map[pox.row - 1][pox.column]
  elseif direction == 2 then
    if pox.column == 4 then
      error("不允许向左移动")
    end
    next = map[pox.row][pox.column + 1]
  elseif direction == 3 then
    if pox.row == 4 then
      error("不允许向下移动")
    end
    next = map[pox.row + 1][pox.column]
  elseif direction == 4 then
    if pox.column == 1 then
      error("不允许向右移动")
    end
    next = map[pox.row][pox.column - 1]
  else
    error("未定义方向")
  end
  assert(next, "不存在的下一步")
  pox:checkShow()
  next:checkShow()
  judge(pox, next)
end
move(map[2][2], 1)
move(map[1][2], 3)
move(map[2][2], 1)
