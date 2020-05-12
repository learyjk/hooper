local entities = require('entities')
local ball = require('entities/ball')
local Timer = require('lib/knife/timer')
local input = require('input')
local state = require('state')
local world = require('world')

math.randomseed(os.time())

local ball_timer = 0
local score = 0
local total_score = 0
local level = 1
local num_balls = level

love.draw = function()
    for _, entity in ipairs(entities) do
        if entity.draw then entity:draw() end
    end

    love.graphics.print('TOTAL: ' .. total_score, 720, 5)
    love.graphics.print('LEVEL: ' .. level, 720, 20)
    love.graphics.print('BALLS: ' .. num_balls, 720, 35)
end

love.keypressed = function(pressed_key)
    input.press(pressed_key)
end

love.keyreleased = function(released_key)
    input.release(released_key)
end

love.update = function(dt)
    if state.paused or state.game_over then
        return
    end

    if state.stage_cleared then
        state.stage_cleared = false
    end

    ball_timer = ball_timer + dt
    if ball_timer >= 1 then
        if num_balls > 0 then
            local b = ball(10, 500, math.random(100, 600), math.random(-300, -500))
            entities[#entities + 1] = b
            ball_timer = 0
            num_balls = num_balls - 1
        end
    end

    local basket = entities[1] --basket is the first entitiy.
    local index = 1
    while index <= #entities do
        local entity = entities[index]
        if entity.update then
            entity:update(dt, basket)
        end

        if entity.type == 'ball' and entity.dead then
            table.remove(entities, index)
            entity.fixture:destroy()
            state.game_over = true
        elseif entity.type == 'ball' and entity.caught then
            table.remove(entities, index)
            entity.fixture:destroy()
            score = score + 1
            total_score = total_score + 1
            if score == level then
                state.stage_cleared = true
                score = 0
                level = level + 1
                num_balls = level
            end
        else
            index = index + 1
        end
    end

    world:update(dt)
end
