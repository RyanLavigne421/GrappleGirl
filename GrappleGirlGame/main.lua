require("Character")
require("love")
FLOOR_CATAGORY = 1

function love.load()
    baseWorld = love.physics.newWorld(0, 1000, false)
    gGirl = Character:new(nil, baseWorld, {100,100},{400, 400});


    -- floor --
    floor = {}
    floor.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 100)
    floor.body = love.physics.newBody( baseWorld, love.graphics.getWidth()/2, love.graphics.getHeight(), "static")
    floor.fixture = love.physics.newFixture(floor.body, floor.shape, 1)
    floor.fixture:setFriction(1);
    floor.fixture:setCategory(FLOOR_CATAGORY);
end

function love.update(dt)
    contacts = baseWorld:getContacts( )
    for i = 0,#baseWorld:getContacts( ) do
        if contacts[i] ~= nil then
            f1, f2 = contacts[i]:getFixtures()
            if f1:getCategory() == FLOOR_CATAGORY and f2:getCategory() == CHARACTER_CATAGORY or f2:getCategory() == FLOOR_CATAGORY and f1:getCategory() == CHARACTER_CATAGORY then
                if f1:getCategory() == FLOOR_CATAGORY then
                    charFic=f2
                else
                    charFic=f1
                end
                charFic:getUserData().canJump = true
            end
            -- print()
        end
    end

    baseWorld:update(dt)
    gGirl:update(dt)
end

function love.draw()
    gGirl:draw()

    -- x,y = floor.body:getPosition()
    -- Shape:ge
    --  love.graphics.rectangle("fill", floor.x, floor.y, floor.shape:get)
end
