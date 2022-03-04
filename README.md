# bumpi.lua

*This README is for who already are familar with [bump.lua](). does not describe bump.lua api or how to use*

bumpi is a fork of [bump.lua]() with new features:
* Slope - Easily add slope rects (right-angled triangles). 
* Layer - You can specify how certain type of rects will interact with other type of rects. 

(TODO: add demos)

## Slope
```lua
world:add(x, y, w, h, { slope = `<type of slope>` } )
```

there's four types of slope - `floor_right`, `floor_left`, `ceil_right`, `ceil_left`

notice that this is only correct for LOVE coordinate system.


## Layer
```lua
bump.newWorld(cellSize, {
  { from: 'particle', to: 'tile', response: 'bounce' },
  { from: 'particle', to: 'particle', response: nil }, -- particles don't have to inteact each others.
  { from: 'player',   to: 'slope_tile', response: 'slide', shape: 'middle-y-line'}
  ...
})
```
If you do not specify the case where `from` and `to` are the same, the reponse will be `slide`


## Tips
Here's some tips for making better platformer game.

maybe this this is out of context but here's a good twitter thread for making better platformer game. [celeste]

## Some Limitation (not implimented yet :q)
- Can not move slope rects. (updating is ok)
- Some utility functions won't work correctly (ex: world:querySegment)

## License
bumpi.lua is licensed under the MIT license.
