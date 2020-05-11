local ball = require('entities/ball')
local basket = require('entities/basket')
local boundary_vertical = require('entities/boundary-vertical')

local entities = {
    ball(0, 600, 300, -300),
    basket(),
    boundary_vertical(800, 0, 800, 600),
    boundary_vertical(0, 0, 0, 600),

}

return entities
