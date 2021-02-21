require("Character")
require("love")
require("Music")

function love.load()
    gGirl = Character:new(nil);
    music = love.audio.play(, "stream", true)
end

function love.update(dt)
    love.audio.update()
    gGirl:update(dt);
end

function love.keypressed(key)
    if key == 'p' then
        love.audio.play(music)
    end
end

function love.draw()
    gGirl:draw()
end
