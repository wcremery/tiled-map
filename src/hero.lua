local Hero = {}
local spritesheet_hero
local SPRITE_HEIGHT = 1
local SPRITE_WIDTH = 4

function Hero.load()
  
  Hero.width = 16
  Hero.height = 16
  Hero.images = {}
  Hero.imgCurrent = 1
  Hero.line = 1
  Hero.column = 1
  
  spritesheet_hero = love.graphics.newImage("graphics/spritesheet_hero.png")
  print("Loading Hero")
  local index = 1
  for l=1, SPRITE_HEIGHT, 1 do
    for c=1, SPRITE_WIDTH, 1 do
      Hero.images[index] = love.graphics.newQuad((c - 1) * Hero.width, (l - 1) * Hero.height, Hero.width, Hero.height, spritesheet_hero:getWidth(), spritesheet_hero:getHeight())
      index = index + 1
    end
  end
  print("Loading Hero finished")
  
end

function Hero.update(dt, pMap)
  
  Hero.imgCurrent = Hero.imgCurrent + (5 * dt)
  if Hero.imgCurrent > #Hero.images then
    Hero.imgCurrent = 1
  end
  
  if love.keyboard.isDown("up") then
    Hero.line = Hero.line - 1
  end
  
  if love.keyboard.isDown("down") then
    Hero.line = Hero.line + 1
  end
  
  if love.keyboard.isDown("left") then
    Hero.column = Hero.column - 1
  end
  
  if love.keyboard.isDown("right") then
    Hero.column = Hero.column + 1
  end
  
  
end

function Hero.draw(pMap)
  local x = (Hero.column - 1) * pMap.tilesets[1].tilewidth
  local y = (Hero.line - 1) * pMap.tilesets[1].tileheight

  love.graphics.draw(spritesheet_hero, Hero.images[math.floor(Hero.imgCurrent)], x, y, 0, 2)
end

function newAnimation(image, width, height, duration)
  
end


return Hero