-- Need to refactor collision detection into reusable function.
function Collision_Detection(x, y, h, w)
    local x1, x2 = math.abs(x - w), math.abs(x + w)
    local y1, y2 = math.abs(y - h), math.abs(y + h)

     -- Check X and Y position.
     if Player.y >= y1 and Player.y <= y2 and Player.x >= x1 and Player.x <= x2 then
        -- Check X axis collision.
        if Player.x >= x1 and Player.x >= x2 then
            Player.x = Player.x + 1
        elseif Player.x <= x2 then
            Player.x = Player.x - 1
        end
        -- Check Y axis collision.
        if Player.y >= y1 and Player.y >= y2 then
            Player.y = Player.y + 1
        elseif Player.y <= y2 then
            Player.y = Player.y - 1
        end
    end
end