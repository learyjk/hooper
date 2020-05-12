local ball = require('entities/ball')
local basket = require('entities/basket')
local boundary = require('entities/boundary')

local window_width, window_height = love.window.getMode()

local entities = {
    ball(10, 500, 300, -300),
    basket(),
    boundary(window_width, 0, window_width, window_height), --right wall
    boundary(0, 0, 0, window_height), --left wall
    boundary(0, 0, window_width, 0), --top
    boundary(0, window_height - 50, window_width/2 - 10, window_height), --left ramp
    boundary(window_width/2 + 10, window_height, window_width, window_height - 50), --right ramp

}

return entities
