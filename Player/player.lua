require 'Events.animations'

Player = {
    x = 100,
    y = 100,
    radius = 20,
    spritesheet = love.graphics.newImage('Assets/Me_Earthbound-Recovered-Sheet.png')
}

function Render_Player()
    -- love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", Player.x, Player.y, Player.radius)
    love.graphics.print("Player: " ..Player.name.. " rendered...", 500, 500)
    love.graphics.draw(Player.spritesheet, 300, 200)
end