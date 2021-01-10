require 'Events.animations'

Enemy = {
    x = 200,
    y = 200,
    tileW = 32,
    tileH = 32,
    spritesheet = love.graphics.newImage('Assets/test_bouncing_blob.png')
}

function Load_Enemy_Assets()
    Enemy_Animation = CreateAnimation(Enemy.spritesheet, Enemy.tileW, Enemy.tileH, 1);
end

function Animate_Enemy(dt)
    Enemy_Animation.currentTime = Enemy_Animation.currentTime + dt;
    if Enemy_Animation.currentTime >= Enemy_Animation.dt then
        Enemy_Animation.currentTime = Enemy_Animation.currentTime - Enemy_Animation.dt
    end
end

function Render_Enemy()
    local currentSpriteFrame = math.floor(Enemy_Animation.currentTime / Enemy_Animation.dt * #Enemy_Animation.quads) + 1
    love.graphics.draw(Enemy_Animation.spritesheet, Enemy_Animation.quads[currentSpriteFrame], Enemy.x, Enemy.y);
end