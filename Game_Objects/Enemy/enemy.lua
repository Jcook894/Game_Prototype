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

Enemy.Load_Enemy_Assets = function(self)
    self.Enemy_Sprite = CreateAnimation(self.spritesheet, self.tileW, self.tileH, 1);
end

Enemy.Animate_Enemy = function(self, dt)
    self.Enemy_Sprite.currentTime = self.Enemy_Sprite.currentTime + dt;
    if self.Enemy_Sprite.currentTime >= self.Enemy_Sprite.dt then
        self.Enemy_Sprite.currentTime = self.Enemy_Sprite.currentTime - self.Enemy_Sprite.dt
    end
end

Enemy.Render_Enemy = function(self)
    local currentSpriteFrame = math.floor(self.Enemy_Sprite.currentTime / self.Enemy_Sprite.dt * #self.Enemy_Sprite.quads) + 1
    love.graphics.draw(self.Enemy_Sprite.spritesheet, self.Enemy_Sprite.quads[currentSpriteFrame], self.x, self.y);
    Collision_Detection(self.x, self.y, self.tileH, self.tileW)
end