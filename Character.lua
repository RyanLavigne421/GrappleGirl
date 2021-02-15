TMP_R_VAL = 20

Character = {pos = {x = 0, y = 0}, vel = {x = 150, y = 150}}

function Character:new(o, xPos, yPos)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.pos = {x = xPos or 0, y = yPos or 0}
    self.vel = {x = 150, y = 150}
    return o;
end

function Character:draw()
    love.graphics.circle("fill", self.pos.x, self.pos.y, TMP_R_VAL)
end

function Character:update(dt)
    self.pos.x = self.pos.x + self.vel.x * dt
    self.pos.y = self.pos.y + self.vel.y * dt

    if (self.pos.x + TMP_R_VAL > love.graphics.getWidth() and self.vel.x > 0) or
        (self.pos.x - TMP_R_VAL < 0 and self.vel.x < 0) then
        self.vel.x = self.vel.x * -1
    end

    if (self.pos.y + TMP_R_VAL > love.graphics.getHeight() and self.vel.y >
        0) or (self.pos.y - TMP_R_VAL < 0 and self.vel.y < 0) then
        self.vel.y = self.vel.y * -1
    end
end
