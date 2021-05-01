--[[
    TODO:
    * Prevent player from 'bouncing' when colliding with game object.
    * Clean up code.
    * ???????? Set Collision "State" when objects collide ????????
    * Player is not colliding, need to check collision and stop player movement.
]]--

-- Checks player position against position of object and prevents player from moving through.
function Collision_Detection(x, y, h, w)
    local x1, x2 = math.abs(x - w), math.abs(x + w)
    local y1, y2 = math.abs(y - h), math.abs(y + h)
     -- Check X and Y position.
     if Player.y >= y1 and Player.y <= y2 and Player.x >= x1 and Player.x <= x2 then
        -- Check Y axis collision.
        if Player.y <= y2 then
            Player.collisionState = "TOP"
        end
        if Player.y >= y1 then
            Player.collisionState = "BOTTOM"
        end
        -- Check X axis collision.
        if Player.x >= x1 then
            Player.collisionState = "LEFT"
        end
        if Player.x <= x2 then
            Player.collisionState = "RIGHT"
        end
        
    end
end