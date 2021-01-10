require 'Events.animations'
-- Player configuration.
Player = {
    x = 0,
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

-- Figure out generic collision detection.
function Check_Collision()
    -- Get Player x Position
    local currentPlayerX = Player.x
    -- Get enemy position and add the tile width to that pos.
    local currentEnemyX1, currentEnemyX2 = math.abs(Enemy.x - Enemy.tileW), math.abs(Enemy.x + Enemy.tileW)
    print('Enemy1: ' ..currentEnemyX1, 'Enemy2: '.. currentEnemyX2)
    print('Player1: ' ..currentPlayerX)
    if (currentPlayerX >= currentEnemyX1 and currentPlayerX <= currentEnemyX2) then
        print("X Collision")
    else
        print('No Collision')
    end
end