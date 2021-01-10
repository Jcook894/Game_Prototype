require 'Game_Objects.Player.player'

-- Get keyboard input and update player based on key pressed.
-- TODO: Incorporate player animation cycle.
function Move_Player()
    if love.keyboard.isDown('w') then
        Player.y = Player.y - 1
    elseif love.keyboard.isDown('s') then
        Player.y = Player.y + 1
    elseif love.keyboard.isDown('a') then
        Player.x = Player.x - 1
    elseif love.keyboard.isDown('d') then
        Player.x = Player.x + 1
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end
