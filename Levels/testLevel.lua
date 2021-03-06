require 'Events.collisionDetection'

--[[
    TODO:
    * Find better alternative to loading tiles.
    * Build tilemap generator???
]]--

-- Level configuration.
Test_Level = {
    tileH = 32,
    tileW = 32,
    tilesheet = love.graphics.newImage('Assets/LOVE_Grass_Tilesheet.png'),
    tileTable = {
        { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 },
        { 2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,2 },
        { 2,1,3,3,1,1,1,1,3,3,1,1,1,1,1,2,1,1,1,1,1,1,1,1,2 },
        { 2,1,3,3,1,1,1,1,3,3,1,2,1,1,1,1,1,1,1,1,1,1,1,1,2 },
        { 2,1,3,3,1,1,1,1,3,3,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2 },
        { 2,1,3,3,1,1,1,1,3,3,2,1,1,3,3,3,3,3,3,3,2,2,1,1,2 },
        { 2,1,3,3,1,1,1,1,3,3,1,1,1,3,3,3,3,3,3,3,1,1,1,1,2 },
        { 2,1,3,3,3,3,3,3,3,3,1,1,1,3,3,1,1,1,3,3,2,2,1,1,2 },
        { 2,1,3,3,3,3,3,3,3,3,1,1,1,3,3,1,2,1,3,3,1,1,1,1,2 },
        { 2,1,1,1,1,3,3,1,2,1,1,2,1,3,3,1,1,1,3,3,1,1,1,1,2 },
        { 2,1,1,2,2,3,3,1,1,2,2,1,1,3,3,3,3,3,3,3,2,2,1,1,2 },
        { 2,1,1,1,1,3,3,1,1,1,1,1,1,3,3,3,3,3,3,3,1,1,1,1,2 },
        { 2,1,1,1,1,3,3,1,1,2,1,1,1,1,2,2,1,1,1,1,1,1,1,1,2 },
        { 2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,2 },
        { 2,1,1,2,1,1,1,1,2,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,2 },
        { 2,1,1,1,1,1,1,1,1,2,1,1,2,1,2,1,1,1,1,1,1,1,1,1,2 },
        { 2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2 },
        { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 },
        { 2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2 }
    }
}

-- Load level assets.
function Load_Level_Settings()
    TileSetH = Test_Level.tilesheet:getHeight()
    TileSetW = Test_Level.tilesheet:getWidth()
    TilesheetQuads = {
        love.graphics.newQuad(0, 0, Test_Level.tileW, Test_Level.tileH, TileSetW, TileSetH),
        love.graphics.newQuad(0, 32, Test_Level.tileW, Test_Level.tileH, TileSetW, TileSetH),
        love.graphics.newQuad(32, 0,  Test_Level.tileW, Test_Level.tileH, TileSetW, TileSetH)
    }
end

-- Move logic into level builder and draw tiles generically.
function Draw_Level()
    for rowIndex = 1, #Test_Level.tileTable do
        local row = Test_Level.tileTable[rowIndex]
        for colIndex = 1, #row do
            local number = row[colIndex]
            love.graphics.draw(Test_Level.tilesheet, TilesheetQuads[number], (colIndex-1) * Test_Level.tileW, (rowIndex-1) * Test_Level.tileH)
            -- Pass rock tile info into Collision Detection.
            if number == 3 then
                local y,x = (rowIndex-1) * Test_Level.tileH, (colIndex-1) * Test_Level.tileW
                Collision_Detection(x, y, Test_Level.tileH, Test_Level.tileW)
            end
        end
    end
end