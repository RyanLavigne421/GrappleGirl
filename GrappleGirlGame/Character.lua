CHARACTER_CATAGORY=2

Character = {}

function Character:new(o, world, pos, speed)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.speed = {x = speed.x or speed[1] or 150, y = speed.y or speed[2] or 150}
    self.mv = {u = false, d = false, r = false, l = false}
    self.shape = love.physics.newRectangleShape(20,20)

    self.body = love.physics.newBody( world, pos.x or pos[1], pos.y or pos[2], "dynamic")
    self.body:setFixedRotation(true)

    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
    self.fixture:setFriction(1)
    self.fixture:setCategory(CHARACTER_CATAGORY)
    self.fixture:setUserData(o)
    -- setmetatable(self.fixture:getUserData().val, self)
    -- self.fixture:getUserData().val = o


    self.canJump = true;

    return o
end

function Character:draw()
    x, y = self.body:getPosition()
    love.graphics.circle("fill", x, y, 20)
end

function Character:update(dt)
    f = 1000
    if (love.keyboard.isDown("a")) then
        self.body:applyForce(-f, 0)
    end
    if (love.keyboard.isDown("d")) then
        self.body:applyForce(f, 0)
    end

    if(self.canJump and love.keyboard.isDown("space"))then
        self.canJump = false
        self.body:applyLinearImpulse(0, -50)
    end

end

function Character:move(d)

end
