function love.load()
   cx = 0
   cy = 0
   cSpeedX = 150
   cSpeedY = 150
   cr = 20
end

function love.update(dt)


    cx = cx + cSpeedX * dt
    cy = cy + cSpeedY * dt


    if (cx+cr > love.graphics.getWidth() and cSpeedX > 0)  or (cx-cr < 0 and cSpeedX < 0) then
        cSpeedX = cSpeedX * -1
    end

    if (cy+cr > love.graphics.getHeight() and cSpeedY > 0) or (cy-cr < 0 and cSpeedY < 0) then
        cSpeedY = cSpeedY * -1
    end

end

function love.draw()
    love.graphics.circle("fill", cx, cy, cr)
end
