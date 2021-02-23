

Character = {}

function Character:new(o, world, pos, speed)
    o = o or {}
    setmetatable(o, self)
    print(pos[1])
    self.__index = self
    self.speed = {x = speed.x or speed[1] or 150, y = speed.y or speed[2] or 150}
    self.mv = {u = false, d = false, r = false, l = false}
    self.shape = love.physics.newCircleShape(20)
    self.body = love.physics.newBody( world, pos.x or pos[1], pos.y or pos[2], "dynamic")
    self.fixture = love.physics.newFixture(self.body, self.shape, 1)
    print(self.shape)
    -- self.shape:setFriction(1)
    self.fixture:setFriction(1)

    return o
end

function Character:draw()
    x, y = self.body:getPosition()
    print("x: ", x, "  y: ", y)
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

end

function Character:move(d)

end
