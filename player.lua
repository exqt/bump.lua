local Player = {}
Player.__index = Player

function Player.new(world, x, y)
    local o = { 
        world = world,
        x = x,
        y = y,
        vx = 0,
        vy = 0
    }
    setmetatable(o, Player)

    world:add(o, x, y, 64, 128)

    return o
end

function Player:moveBy(dx, dy)
    local actualX, actualY, cols, len = self.world:move(self, self.x + dx, self.y + dy)
    self.x, self.y = actualX, actualY
end

function Player:checkGround()
    local actualX, actualY, cols, len = self.world:check(self, self.x, self.y + 1e-9)
    return len > 0
end

function Player:update(dt)
    local isDown = love.keyboard.isDown
    local S = 500

    self.vx = 0
    if isDown('a') then
        self.vx = -S
    elseif isDown('d') then
        self.vx = S
    end

    if isDown('w') then vy = -S elseif isDown('s') then vy = S end
    if not self:checkGround() then
        self.vy = self.vy + 900*dt
    else
        self.vy = 0
    end
    if pressed['space'] then self.vy = -400 end

    self:moveBy(self.vx*dt, self.vy*dt)
end


function Player:draw()
    local g = love.graphics
    local x, y, w, h = self.world:getRect(self)
    g.setColor(0, 1, 0)
    g.rectangle("line", x, y, w, h)
    g.setColor(0, 1, 0, 0.5)
    g.rectangle("fill", x, y, w, h)
    g.print(tostring(self.x) .. " " .. tostring(self.y), x, y)
end

return Player

