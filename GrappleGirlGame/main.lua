require("Character")
require("love")

function love.load()
    gGirl = Character:new(nil);
end

function love.update(dt)
    gGirl:update(dt);
end

function love.draw()
    gGirl:draw()
end
