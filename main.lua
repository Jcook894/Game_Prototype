require 'Player.player'
require 'Events.userInput'

function love.load()
    Player.name = 'Julian Cook'
    love.window.setTitle("Julian's Prototype")
    -- will set to full screen, commented out for now.
    -- love.window.setFullscreen(true, "desktop")
end

function love.update(dt)
    Move_Player()
end

function love.draw()
    local _, _, flags = love.window.getMode()
 
    -- The window's flags contain the index of the monitor it's currently in.
    local width, height = love.window.getDesktopDimensions(flags.display)
 
    love.graphics.print(("Display %d: %d x %d"):format(flags.display, width, height), 4, 10)
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