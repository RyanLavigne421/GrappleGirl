require("Character")
require("love")
FLOOR_CATAGORY = 1

function love.load()
    baseWorld = love.physics.newWorld(0, 1000, false)
    gGirl = Character:new(nil, baseWorld, {love.graphics.getWidth()/2,100},{400, 400});


    -- floor --
    floor = {}
    floor.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 100)
    floor.body = love.physics.newBody( baseWorld, love.graphics.getWidth()/2, love.graphics.getHeight(), "static")
    floor.fixture = love.physics.newFixture(floor.body, floor.shape, 1)
    floor.fixture:setFriction(1);
    floor.fixture:setCategory(FLOOR_CATAGORY);
    -- floor end --

    -- grappleAnchor --
    grappleAnchor = {}
    grappleAnchor.shape = love.physics.newRectangleShape(50, 50)
    grappleAnchor.body = love.physics.newBody( baseWorld, love.graphics.getWidth()/2, love.graphics.getHeight()/2, "static")
    grappleAnchor.fixture = love.physics.newFixture(grappleAnchor.body, grappleAnchor.shape, 1)
    grappleAnchor.fixture:setFriction(1);
    grappleAnchor.fixture:setCategory(FLOOR_CATAGORY);
    -- grappleAnchor end --

end

function love.update(dt)
    local contacts = baseWorld:getContacts( )
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
    tmpHandleRope(dt)
end

function love.draw()
    gGirl:draw()

    local gaPos = {}
    gaPos.x, gaPos.y = grappleAnchor.body:getPosition()
    love.graphics.rectangle("fill", gaPos.x-25, gaPos.y-25, 50, 50)


    if grappleropejoint.joint ~= nil then
        
        local x1, y1 = gGirl.body:getPosition()
        local x2, y2 = grappleropejoint.body:getPosition()
        love.graphics.line(x1, y1, x2, y2)
    end
end
