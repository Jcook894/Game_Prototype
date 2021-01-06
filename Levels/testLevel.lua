Test_Level = {
    tilesheet = love.graphics.newImage('Assets/LOVE_Grass_Tilesheet.png')
}

function LoadLevelSettings()
    -- Set Tile width and height
    local tileH, tileW = 32, 32
    local tileSetH, tileSetW = Test_Level.tilesheet:getHeight(), Test_Level.tilesheet:getWidth()

    -- Create quads for each tile in tilesheet.
    GrassTile = love.graphics.newQuad(0, 0, tileW, tileH, tileSetW, tileSetH)
    FlowerTile = love.graphics.newQuad(0, 32, tileW, tileH, tileSetW, tileSetH)
    RockTile = love.graphics.newQuad(32, 0, tileW, tileH, tileSetW, tileSetH)
end

function Draw_Level()
    -- Move logic into level builder and draw tiles generically.
    love.graphics.draw(Test_Level.tilesheet, GrassTile, 400, 268)
    love.graphics.draw(Test_Level.tilesheet, FlowerTile, 432, 268)
    love.graphics.draw(Test_Level.tilesheet, GrassTile, 464, 268)

    love.graphics.draw(Test_Level.tilesheet, FlowerTile,  400, 236)
    love.graphics.draw(Test_Level.tilesheet, RockTile,  432, 236)
    love.graphics.draw(Test_Level.tilesheet, FlowerTile,  464, 236)

    love.graphics.draw(Test_Level.tilesheet, GrassTile, 400, 204)
    love.graphics.draw(Test_Level.tilesheet, FlowerTile, 432, 204)
    love.graphics.draw(Test_Level.tilesheet, GrassTile, 464, 204)
end