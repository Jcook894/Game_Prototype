require 'Player.player'
local up, down, left, right = love.keyboard.isDown("w"), love.keyboard.isDown("s"), love.keyboard.isDown("a"), love.keyboard.isDown("d")

-- Get keyboard input and update player based on key pressed.
function Move_Player()
    if up then 
        Player.x = Player.x + 1
        print(Player.x)
    elseif down then
        Player.x = Player.x - 1
        print(Player.x)
    elseif left then
        Player.y = Player.y - 1
        print(Player.y)
    elseif right then
        Player.y = Player.y + 1
        print(Player.y)
    end
end