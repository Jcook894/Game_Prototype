-- TODO:
-- * Incorporate animation cycle.
-- * Add in diagonal movement.
        -- Need to figure out better implementation for diagonal movement
-- * Polish movements, needs to be fluid.

-- Get keyboard input and update player based on key pressed.
function Move_Player(gameObj)
    if love.keyboard.isDown('w') then
        gameObj.y = gameObj.y - gameObj.speed
        -- diagonal movement.
        if love.keyboard.isDown('a') then
            gameObj.x = gameObj.x - gameObj.speed
        elseif love.keyboard.isDown('d') then
            gameObj.x = gameObj.x + gameObj.speed
        end
    elseif love.keyboard.isDown('s') then
        gameObj.y = gameObj.y + gameObj.speed
        -- diagonal movement.
        if love.keyboard.isDown('a') then
            gameObj.x = gameObj.x - gameObj.speed
        elseif love.keyboard.isDown('d') then
            gameObj.x = gameObj.x + gameObj.speed
        end
    elseif love.keyboard.isDown('a') then
        gameObj.x = gameObj.x - gameObj.speed
    elseif love.keyboard.isDown('d') then
        gameObj.x = gameObj.x + gameObj.speed
    end
end

-- Exit game.
function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end



















































