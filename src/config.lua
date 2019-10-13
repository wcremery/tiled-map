local Config = {}

function Config.load()

    -- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
    io.stdout:setvbuf('no')

    -- Empèche Love de filtrer les contours des images quand elles sont redimentionnées
    -- Indispensable pour du pixel art
    love.graphics.setDefaultFilter("nearest")

    -- Cette ligne permet de déboguer pas à pas dans ZeroBraneStudio
    if arg[#arg] == "-debug" then require("mobdebug").start() end

    love.window.setTitle("RPG Game")
    love.window.setMode(800, 600)
    
end

return Config