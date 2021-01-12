require 'Events.animations'

-- Player configuration.
Player = {
    x = 500,
    y = 500,
    tileW = 32,
    tileH = 42,
    name = 'Julian Cook',
    spritesheet = love.graphics.newImage('Assets/Me_Earthbound-Recovered-Sheet.png')
}

function Load_Player_Assets()
    Player_Sprite = CreateAnimation(Player.spritesheet, Player.tileW, Player.tileH, 1);
end

function Animate_Player(dt)
    Player_Sprite.currentTime = Player_Sprite.currentTime + dt;
    if Player_Sprite.currentTime >= Player_Sprite.dt then
        Player_Sprite.currentTime = Player_Sprite.currentTime - Player_Sprite.dt
    end
end

function Render_Player()
    local currentSpriteFrame = math.floor(Player_Sprite.currentTime / Player_Sprite.dt * #Player_Sprite.quads) + 1
    love.graphics.draw(Player_Sprite.spritesheet, Player_Sprite.quads[currentSpriteFrame], Player.x, Player.y);
end

-- TODO:
-- *Figure out better implementation.
-- *Rename variables
-- *Figure out generic collision detection.
-- *Make sure collision detection isnt resource intesive.
-- *Set Collision detection on tilemaps.

function Collision_Detection()
    -- Get enemy position and add the tile width to that pos (from left and right of position).
    local x1, x2 = math.abs(Enemy.x - Enemy.tileW), math.abs(Enemy.x + Enemy.tileW)
    local y1, y2 = math.abs(Enemy.y - Enemy.tileH), math.abs(Enemy.y + Enemy.tileH)

    -- Check X and Y position.
    if Player.y >= y1 and Player.y <= y2 and Player.x >= x1 and Player.x <= x2 then
        
        -- Check X axis collision.
        if Player.x >= x1 and Player.x >= x2 then
            Player.x = Player.x + 1
        elseif Player.x <= x2 then
            Player.x = Player.x - 1
        end

        -- Check Y axis collision.
        if Player.y >= y1 and Player.y >= y2 then
            Player.y = Player.y + 1
        elseif Player.y <= y2 then
            Player.y = Player.y - 1
        end
    end

end