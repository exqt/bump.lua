local Tile = {}
Tile.__index = Tile

function Tile.new(world, x, y, w, h, props)
    local o = { world = world }
    setmetatable(o, Tile)

    world:add(o, x, y, w, h, props)

    return o
end

function Tile:update()

end

function Tile:draw()
    local g = love.graphics
    local x, y, w, h, props = self.world:getRect(self)

    if not props.slope then
        g.setColor(1, 0, 0)
        g.rectangle("line", x, y, w, h)
        g.setColor(1, 0, 0, 0.5)
        g.rectangle("fill", x, y, w, h)
    elseif props.slope == "FLOOR_RIGHT" then
        local vertices = {
            x, y + h, 
            x + w, y + h,
            x + w, y
        }
        g.setColor(1, 0, 0)
        g.polygon("line", vertices)
        g.setColor(1, 0, 0, 0.5)
        g.polygon("fill", vertices)
    end
end

return Tile
