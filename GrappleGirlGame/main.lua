require("Character")
require("love")

function love.load()
    baseWorld = love.physics.newWorld(0, 1000, true)
    gGirl = Character:new(nil, baseWorld, {100,100},{400, 400});


    -- floor --
    floor = {}
    floor.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 100)
    floor.body = love.physics.newBody( baseWorld, love.graphics.getWidth()/2, love.graphics.getHeight(), "static")
    floor.fixture = love.physics.newFixture(floor.body, floor.shape, 1)
    floor.fixture:setFriction(1)
end

function love.update(dt)
    baseWorld:update(dt)
    gGirl:update(dt)
end

function love.draw()
    gGirl:draw()
    x,y = floor.body:getPosition()
end
