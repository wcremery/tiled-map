local myConfig = require("config")
local myGame = require("game")
local myHero = require("hero")

function love.load()

    myConfig.load()
    myGame.load()
    myHero.load()

end

function love.update(dt)
  
  myGame.update(dt)
  
end

function love.draw()
    
    myGame.draw()
    
end