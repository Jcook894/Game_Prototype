Player = {}

Player.x = 100
Player.y = 100
Player.radius = 20

function Render_Player()
    love.graphics.setColor(0, 0, 1)
    love.graphics.circle("fill", Player.x, Player.y, Player.radius)
    love.graphics.print("Player: " ..Player.name.. " rendered...", 500, 500)
end