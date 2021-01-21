require 'Game_Objects.Player.player'

-- TODO:
-- * Incorporate player animation cycle.
-- * Add in diagonal movement.
        -- Need to figure out better implementation for diagonal movement
-- * Polish player movements, needs to be fluid.


-- Get keyboard input and update player based on key pressed.
function Move_Player()
    if love.keyboard.isDown('w') then
        Player.y = Player.y - Player.speed
        -- diagonal movement.
        if love.keyboard.isDown('a') then
            Player.x = Player.x - Player.speed
        elseif love.keyboard.isDown('d') then
            Player.x = Player.x + Player.speed
        end
    elseif love.keyboard.isDown('s') then
        Player.y = Player.y + Player.speed
        -- diagonal movement.
        if love.keyboard.isDown('a') then
            Player.x = Player.x - Player.speed
        elseif love.keyboard.isDown('d') then
            Player.x = Player.x + Player.speed
        end
    elseif love.keyboard.isDown('a') then
        Player.x = Player.x - Player.speed
    elseif love.keyboard.isDown('d') then
        Player.x = Player.x + Player.speed
    end
end

-- End game.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end



















































