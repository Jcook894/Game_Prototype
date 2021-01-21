require 'Events.animations'
require 'Events.userInput'

-- Player configuration.
Player = {
    x = 500,
    y = 500,
    speed = 1,
    tileW = 32,
    tileH = 42,
    name = 'Julian Cook',
    spritesheet = love.graphics.newImage('Assets/Me_Earthbound-Recovered-Sheet.png')
}

function Player.Load_Player_Assets(self)
    self.Player_Sprite = CreateAnimation(self.spritesheet, self.tileW, self.tileH, 1);
end

function Player.Animate_Player(self, dt)
    self.Player_Sprite.currentTime = self.Player_Sprite.currentTime + dt;
    if self.Player_Sprite.currentTime >= self.Player_Sprite.dt then
        self.Player_Sprite.currentTime = self.Player_Sprite.currentTime - self.Player_Sprite.dt
    end
end

function Player.Render_Player(self)
    local currentSpriteFrame = math.floor(self.Player_Sprite.currentTime / self.Player_Sprite.dt * #self.Player_Sprite.quads) + 1
    love.graphics.draw(self.Player_Sprite.spritesheet, self.Player_Sprite.quads[currentSpriteFrame], self.x, self.y);
end