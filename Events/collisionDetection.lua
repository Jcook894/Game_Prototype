-- Checks player position against position of object and prevents player from moving through.
-- TODO: Prevent player from 'bouncing' when colliding with game object.

function Collision_Detection(x, y, h, w)
    local x1, x2 = math.abs(x - w), math.abs(x + w)
    local y1, y2 = math.abs(y - h), math.abs(y + h)
     -- Check X and Y position.
     if Player.y >= y1 and Player.y <= y2 and Player.x >= x1 and Player.x <= x2 then
        -- Check X axis collision.
        if Player.x >= x1 and Player.x >= x2 then
            Player.x = Player.x + Player.speed
        elseif Player.x <= x2 then
            Player.x = Player.x - Player.speed
        end
        -- Check Y axis collision.
        if Player.y >= y1 and Player.y >= y2 then
            Player.y = Player.y + Player.speed
        elseif Player.y <= y2 then
            Player.y = Player.y - Player.speed
        end
    end
end