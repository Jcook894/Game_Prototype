-- TODO:
-- *  Prevent player from 'bouncing' when colliding with game object.
-- *  Clean up code.

-- Checks player position against position of object and prevents player from moving through.
function Collision_Detection(obj1, obj2)
    -- Re-working collision detection.
    if obj1.x < obj2.x + obj2.tileW
    and obj1.x + obj1.tileW > obj2.x
    and obj1.y < obj2.y + obj2.tileH
    and obj1.y + obj1.tileH > obj2.y then
    -- Prevent player from passing through object.
        print("COLLISION")
    else
        print("NO COLLISION")
    end
end
