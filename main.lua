local bump = require('bump')
local Tile = require('tile')
local Player = require('player')

local world = bump.newWorld(64)
local entities = {}
pressed = {}

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
table.insert(entities, Player.new(world, 0, 0))

function love.load()
end

function love.keypressed(key)
    pressed[key] = true
end

function love.update(dt)
    for i, e in ipairs(entities) do
        e:update(dt)
    end
    pressed = {}
end

function love.draw()
    for i, e in ipairs(entities) do
        e:draw()
    end
end
