require 'Levels.testLevel'
require 'Game_Objects.Player.player'
require 'Game_Objects.Enemy.enemy'
require 'Events.userInput'
require 'Events.animations'

function love.load()
    WindowWidth, WindowHeight, Frame = love.window.getMode()
    Enemy:Load_Enemy_Assets()
    Player:Load_Player_Assets()
    Load_Level_Settings()
end

function love.update(dt)
    Move_Player(Player)
    Enemy:Animate_Enemy(dt)
    Player:Animate_Player(dt)
end

function love.draw()
    Camera_System()
    Draw_Level()
    Player:Render_Player()
    Enemy:Render_Enemy()
end

function Camera_System()
    local dx, dy = math.floor(-Player.x + WindowHeight / 2), math.floor(-Player.y + WindowHeight / 2)
    love.graphics.translate(dx, dy)
end
