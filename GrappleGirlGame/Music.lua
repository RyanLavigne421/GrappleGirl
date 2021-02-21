--[[
Music = {}
Music.queue = {}

function Music:play(data)
    -- In love2d you can use Static or Stream for playing Music
	local src = love.audio.newSource(data, "static")
    src:setVolume(0.5)
    src:play()
end
--]]
do
    -- will hold the currently playing sources
    local sources = {}
 
    -- check for sources that finished playing and remove them
    -- add to love.update
    function love.audio.update()
        local remove = {}
        for _,s in pairs(sources) do
            if s:isStopped() then
                remove[#remove + 1] = s
            end
        end
 
        for i,s in ipairs(remove) do
            sources[s] = nil
        end
    end
 
    -- overwrite love.audio.play to create and register source if needed
    local play = love.audio.play
    function love.audio.play(what, how, loop)
        local src = what
        if type(what) ~= "userdata" or not what:typeOf("Source") then
            src = love.audio.newSource(what, how)
            src:setLooping(loop or false)
        end
 
        play(src)
        sources[src] = src
        return src
    end
 
    -- stops a source
    local stop = love.audio.stop
    function love.audio.stop(src)
        if not src then return end
        stop(src)
        sources[src] = nil
    end
end