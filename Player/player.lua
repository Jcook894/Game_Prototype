require 'Events.animations'

-- Player configuration.
Player = {
    x = 100,
    y = 100,
    tileW = 32,
    tileH = 42,
    name = 'Julian Cook',
    spritesheet = love.graphics.newImage('Assets/Me_Earthbound-Recovered-Sheet.png')
}

function LoadPlayerAssets()
    local spritesheetW, spritesheetH = Player.spritesheet:getWidth(), Player.spritesheet:getHeight()
    PlayerSprite = love.graphics.newQuad(96, 0, Player.tileW, Player.tileH, spritesheetW, spritesheetH)

    -- TODO: Create animation cycle from spritesheet.
    SpriteSheetQuads = {
        love.graphics.newQuad(0, 0, Player.tileW, Player.tileH, spritesheetW, spritesheetH),
        love.graphics.newQuad(32, 0, Player.tileW, Player.tileH, spritesheetW, spritesheetH),
        love.graphics.newQuad(64, 0, Player.tileW, Player.tileH, spritesheetW, spritesheetH),
        love.graphics.newQuad(96, 0, Player.tileW, Player.tileH, spritesheetW, spritesheetH)
    }
end


function Render_Player()
    love.graphics.print("Player: " ..Player.name.. " rendered...", 500, 500)
    love.graphics.draw(Player.spritesheet, PlayerSprite, Player.x, Player.y)
end