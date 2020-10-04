require 'Player.player'
require 'Events.UserInput'

function love.load()
    Player.name = 'Julian Cook';
end

function love.update(dt)
    Move_Player()
end

function love.draw()
    Render_Player()
end