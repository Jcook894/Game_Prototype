require 'Events.animations'
require 'Events.collisionDetection'

-- Enemy Table.
Enemy = {
    x = 300,
    y = 300,
    tileW = 32,
    tileH = 32,
    name = 'Test Enemy',
    spritesheet = love.graphics.newImage('Assets/test_bouncing_blob.png')
}

-- Unload enemy assets.
function Enemy:Load_Enemy_Assets()
    self.Enemy_Sprite = CreateAnimation(self.spritesheet, self.tileW, self.tileH, 1);
end

-- Update enemy frame base on dt.
function Enemy:Animate_Enemy(dt)
    self.Enemy_Sprite.currentTime = self.Enemy_Sprite.currentTime + dt;
    if self.Enemy_Sprite.currentTime >= self.Enemy_Sprite.dt then
        self.Enemy_Sprite.currentTime = self.Enemy_Sprite.currentTime - self.Enemy_Sprite.dt
    end
end

-- Render enemy in game world.
function Enemy:Render_Enemy()
    local currentSpriteFrame = math.floor(self.Enemy_Sprite.currentTime / self.Enemy_Sprite.dt * #self.Enemy_Sprite.quads) + 1
    love.graphics.draw(self.Enemy_Sprite.spritesheet, self.Enemy_Sprite.quads[currentSpriteFrame], self.x, self.y);
    Collision_Detection(Player, Enemy)
end