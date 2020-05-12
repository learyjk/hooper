local ball = require('entities/ball')
local basket = require('entities/basket')
local boundary = require('entities/boundary')
local stage_cleared_text = require('entities/stage-cleared-text')
local game_over_text = require('entities/game-over-text')

local state = require('state')

local window_width, window_height = love.window.getMode()

local entities = {
    basket(), --basket must be first entity for main.lua
    boundary(window_width, 0, window_width, window_height), --right wall
    boundary(0, 0, 0, window_height), --left wall
    boundary(0, 0, window_width, 0), --top
    boundary(0, window_height - 50, window_width/2 - 10, window_height), --left ramp
    boundary(window_width/2 + 10, window_height, window_width, window_height - 50), --right ramp
    stage_cleared_text(),
    game_over_text(),
}

return entities
