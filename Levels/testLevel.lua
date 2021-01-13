require 'Events.collisionDetection'

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
            -- Pass into Barrier Detection.
            if number == 3 then
                local y,x = (rowIndex-1) * Test_Level.tileH, (colIndex-1) * Test_Level.tileW
                Collision_Detection(x, y, Test_Level.tileH, Test_Level.tileW)
            end
        end
    end
end

-- Need to refactor collision detection into reusable function.
-- function Barrier_Detection(x, y)
--     local tileX1, tileX2 = math.abs(x - Test_Level.tileW), math.abs(x + Test_Level.tileW)
--     local tileY1, tileY2 = math.abs(y - Test_Level.tileH), math.abs(y + Test_Level.tileH)

--      -- Check X and Y position.
--      if Player.y >= tileY1 and Player.y <= tileY2 and Player.x >= tileX1 and Player.x <= tileX2 then
--         -- Check X axis collision.
--         if Player.x >= tileX1 and Player.x >= tileX2 then
--             Player.x = Player.x + 1
--         elseif Player.x <= tileX2 then
--             Player.x = Player.x - 1
--         end
--         -- Check Y axis collision.
--         if Player.y >= tileY1 and Player.y >= tileY2 then
--             Player.y = Player.y + 1
--         elseif Player.y <= tileY2 then
--             Player.y = Player.y - 1
--         end
--     end
-- end