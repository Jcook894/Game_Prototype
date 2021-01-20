-- Create generic func. that will take spritesheets and animate them, based on image properties.
function CreateAnimation(img, width, height, dt)
    local animationObj = {};
    animationObj.quads = {};
    animationObj.spritesheet = img;
    animationObj.dt = dt or 1;
    animationObj.currentTime = 0;
    -- Set quads for spritesheet.
    for y = 0, animationObj.spritesheet:getHeight() - height, height do
        for x = 0, animationObj.spritesheet:getWidth() - width, width do
            table.insert(animationObj.quads, love.graphics.newQuad(x, y, width, height, img:getDimensions()));
        end
    end

    return animationObj;
end