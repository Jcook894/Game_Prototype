require 'Levels.testLevel'
require 'Game_Objects.Player.player'
require 'Game_Objects.Enemy.enemy'
require 'Events.userInput'
require 'Events.animations'

function love.load()
    WindowWidth, WindowHeight, Frame = love.window.getMode()
    Load_Enemy_Assets()
    Load_Player_Assets()
    Load_Level_Settings()
end

function love.update(dt)
    Move_Player()
    Animate_Enemy(dt)
    Animate_Player(dt)
end

function love.draw()
    Camera_System()
    Draw_Level()
    Render_Player()
    Render_Enemy()
end

function Camera_System()
    local dx, dy = math.floor(-Player.x + WindowHeight / 2), math.floor(-Player.y + WindowHeight / 2)
    love.graphics.translate(dx, dy)
end
