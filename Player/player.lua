require 'Events.animations'

Player = {
    x = 100,
    y = 100,
    radius = 20,
    name = 'Julian Cook',
    spritesheet = love.graphics.newImage('Assets/Me_Earthbound-Recovered-Sheet.png')
}

function LoadPlayerAssets()
    local tileW, tileH = 32, 42
    local spritesheetW, spritesheetH = Player.spritesheet:getWidth(), Player.spritesheet:getHeight()
    PlayerSprite = love.graphics.newQuad(0, 0, tileW, tileH, spritesheetW, spritesheetH)
end


function Render_Player()
    -- love.graphics.circle("fill", Player.x, Player.y, Player.radius)
    love.graphics.print("Player: " ..Player.name.. " rendered...", 500, 500)
    love.graphics.draw(Player.spritesheet, PlayerSprite, 300, 200)
end