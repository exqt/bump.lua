local bump = require('bump')

local getSI = bump.rect.getSegmentIntersectionIndices
local getDiff = bump.rect.getDiff

print(getSI(0, 0, 16, 16, 0, -5, 8, 18))