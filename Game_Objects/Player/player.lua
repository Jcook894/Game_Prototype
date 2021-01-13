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