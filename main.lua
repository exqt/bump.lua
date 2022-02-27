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
            local t 
            if line:sub(i, i) == "#" then
                t = Tile.new(world, (i-1)*64, y, 64, 64)
            elseif line:sub(i, i) == "/" then
                t = Tile.new(world, (i-1)*64, y, 64, 64, { slope = bump.consts.FLOOR_RIGHT } )
            elseif line:sub(i, i) == "2" then
                t = Tile.new(world, (i-1)*64, y, 64*2, 64, { slope = bump.consts.FLOOR_RIGHT } )
            elseif line:sub(i, i) == "3" then
                t = Tile.new(world, (i-1)*64, y, 64*3, 64, { slope = bump.consts.FLOOR_RIGHT } )
            end

            table.insert(entities, t)
        end
        y = y + 64
    end
    f:close()
end
loadMap()

local player = Player.new(world, 0, 64*5)
table.insert(entities, player)

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

    local g = love.graphics
    local sw, sh = g.getDimensions()
    g.push()
    g.translate(-player.x + sw/2, -player.y + sh/2)
    for i, e in ipairs(entities) do
        e:draw()
    end
    g.pop()
end
