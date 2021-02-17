-- Initialize basic tiles, level editor doesn't need textures or anything fancy.
tiles = {
	{
		name = "air",
		color = {255, 255, 255}
	},
	{
		name = "wall",
		color = {0, 0, 0}
	},
	{
		name = "lava",
		color = {255, 0, 0}
	}
}

-- Create a map of all of the tiles by name
tilesByName = {}
-- Populate the map
for key, value in pairs(tiles) do
	tilesByName[value.name] = value
end

local width, height = love.graphics.getDimensions()

-- Draw a single tile to the screen. Inverts y so that 0 is the bottom of the window.
-- Todo: Add camera x and y, and make this function adjust where tiles are drawn based on camera position.
function drawTile(tile, x, y)
	love.graphics.setColor(tile.color[1] / 255, tile.color[2] / 255, tile.color[3] / 255, 1)
	love.graphics.rectangle("fill", x * 20, height - ((y + 1) * 20), 20, 20)
end

function love.draw()
	-- Test drawing single tile, TODO implement editing tiles
	drawTile(tilesByName.lava, 0, 0)
end
