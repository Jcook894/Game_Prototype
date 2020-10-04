require 'Player.player'

-- Get keyboard input and update player based on key pressed.
function Move_Player()
    if love.keyboard.isDown('w') then
        Player.y = Player.y - 1
        print(Player.y)
    elseif love.keyboard.isDown('s') then
        Player.y = Player.y + 1
        print(Player.x)
    elseif love.keyboard.isDown('a') then
        Player.x = Player.x - 1
        print(Player.y)
    elseif love.keyboard.isDown('d') then
        Player.x = Player.x + 1
        print(Player.y)
    end
end