local bump = require('bump')

local getSI = bump.rect.getSegmentIntersection
local getDiff = bump.rect.getDiff

local x1, y1, w1, h1 = 15, 0, 16, 16
local x2, y2, w2, h2 = 0, 0, 16, 16

print(getDiff(x1,y1,w1,h1, x2,y2,w2,h2))
