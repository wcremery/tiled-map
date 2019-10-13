local Game = {}
local map = require("mapTiled")
local TILE_HEIGHT = 19
local TILE_WIDTH = 9

function Game.load()
  
  Game.TileSheet = love.graphics.newImage("graphics/tileSheet_map.png")
  Game.TileTextures = {}
  print("Loading map")
  local i = 1
  for l=1, TILE_HEIGHT, 1 do
      for c=1, TILE_WIDTH, 1 do
          Game.TileTextures[i] = love.graphics.newQuad((c-1) * map.tilewidth, (l-1) * map.tileheight, map.tilewidth, map.tileheight, Game.TileSheet:getWidth(), Game.TileSheet:getHeight()) 
          i = i+1
      end
  end
  print("Loading map finished")
  
  Game.Hero = require("hero")
  
  Game.Hero.load()

end

function Game.update(dt)
  
  column = math.floor(love.mouse.getX() / map.tilewidth) + 1
  line = math.floor(love.mouse.getY() / map.tileheight) + 1
  
  for i=1, #map.layers[1].data, 1 do
    id = map.layers[1].data[((line - 1) * map.layers[1].width) + column]
    print(id)
  end
  
  Game.Hero.update(dt, map)
  
end

function Game.draw()

  local i = 1
  for l=1, map.height, 1 do
      for c=1, map.width, 1 do
        id = map.layers[1].data[i]
        love.graphics.draw(Game.TileSheet, Game.TileTextures[id], (c-1) * map.tilewidth, (l-1) * map.tileheight)
        i = i+1        
      end
  end
  
  Game.Hero.draw(map)

end

return Game