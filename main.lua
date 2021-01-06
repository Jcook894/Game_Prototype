require 'Player.player'
require 'Events.userInput'

function love.load()
    Player.name = 'Julian Cook'
    love.window.setTitle("Julian's Prototype")
    Test_tileSet = love.graphics.newImage('Assets/LOVE_Grass_Tilesheet.png')
    
    -- Set Tile width and height
    local tileH, tileW = 32, 32
    local tileSetH, tileSetW = Test_tileSet:getHeight(), Test_tileSet:getWidth()

    GrassTile = love.graphics.newQuad(0, 0, tileW, tileH, tileSetW, tileSetH)
    FlowerTile = love.graphics.newQuad(0, 32, tileW, tileH, tileSetW, tileSetH)
    RockTile = love.graphics.newQuad(32, 0, tileW, tileH, tileSetW, tileSetH)

    -- will set to full screen (commented out for now).
    -- love.window.setFullscreen(true, "desktop")
end

function love.update(dt)
    Move_Player()
end

function love.draw()
    -- Move logic into level builder and draw tiles generically.
    love.graphics.draw(Test_tileSet, GrassTile, 368, 268)
    love.graphics.draw(Test_tileSet, GrassTile, 400, 268)
    love.graphics.draw(Test_tileSet, FlowerTile, 432, 268)
    love.graphics.draw(Test_tileSet, GrassTile, 464, 268)
    love.graphics.draw(Test_tileSet, GrassTile,  368, 236)
    love.graphics.draw(Test_tileSet, RockTile,  400, 236)
    love.graphics.draw(Test_tileSet, GrassTile,  432, 236)

    Render_Player()
end

-- Will close out game instance. TODO: I will need to revist and change logic.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function Start_Menu()
    love.graphics.print("GAME PROTOTYPE", 10, 250, 0, 2, 2)
end