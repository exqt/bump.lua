local Tile = {}
Tile.__index = Tile

function Tile.new(world, x, y, w, h)
    local o = { world = world }
    setmetatable(o, Tile)

    world:add(o, x, y, w, h)

    return o
end

function Tile:update()

end

function Tile:draw()
    local g = love.graphics
    local x, y, w, h = self.world:getRect(self)
    g.setColor(1, 0, 0)
    g.rectangle("line", x, y, w, h)
    g.setColor(1, 0, 0, 0.5)
    g.rectangle("fill", x, y, w, h)
end

return Tile
