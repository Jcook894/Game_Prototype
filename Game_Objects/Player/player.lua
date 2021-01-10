require 'Events.animations'
-- Player configuration.
Player = {
    x = 500,
    y = 0,
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
-- *Rename variables
-- *Figure out generic collision detection.
-- *Make sure collision detection isnt resource intesive.
-- *Set Collision detection on tilemaps.
function Check_Collision()
    -- Get Player x Position
    local currentPlayerX, currentPlayerY = Player.x, Player.y

    -- Get enemy position and add the tile width to that pos (from left and right of position).
    local currentEnemyX1, currentEnemyX2 = math.abs(Enemy.x - Enemy.tileW), math.abs(Enemy.x + Enemy.tileW)
    local currentEnemyY1, currentEnemyY2 = math.abs(Enemy.y - Enemy.tileH), math.abs(Enemy.y + Enemy.tileH)

    -- Check X position.
    if (currentPlayerX >= currentEnemyX1 and currentPlayerX <= currentEnemyX2) then
        print('X: Collision Detected');
    else
        print('X: No Collision')
    end

    -- Check Y position.
    if (currentPlayerY <= currentEnemyY1 and currentPlayerY >= currentEnemyY2) then
        print('Y: Collision Detected')
    else
        print('Y: No Collision')
    end
end