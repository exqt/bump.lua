local bump = require('bump')
local Tile = require('tile')

local world = bump.newWorld(64)
local entities = {}

function loadMap()
    local f = io.open("map.txt", "r")
    local y = 0
    for line in f:lines() do
        for i=1, #line do
            if line:sub(i, i) == "#" then
                local t = Tile.new(world, (i-1)*64, y, 64, 64)
                table.insert(entities, t)
            end
        end
        y = y + 64
    end
    f:close()
end
loadMap()

function love.load()

end

function love.update(dt)

end

function love.draw()
    for i, e in ipairs(entities) do
        e:draw()
    end
end
