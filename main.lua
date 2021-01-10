require 'Levels.testLevel'
require 'Game_Objects.Player.player'
require 'Game_Objects.Enemy.enemy'
require 'Events.userInput'
require 'Events.animations'

function love.load()
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
    Draw_Level()
    Render_Player()
    Render_Enemy()
end