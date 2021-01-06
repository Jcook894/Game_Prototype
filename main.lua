require 'Player.player'
require 'Events.userInput'

function love.load()
    Player.name = 'Julian Cook'
    love.window.setTitle("Julian's Prototype")
    -- will set to full screen (commented out for now).
    -- love.window.setFullscreen(true, "desktop")
end

function love.update(dt)
    Move_Player()
end

function love.draw()
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