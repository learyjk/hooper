local entities = require('entities')
local ball = require('entities/ball')
local Timer = require('lib/knife/timer')
local input = require('input')
local state = require('state')
local world = require('world')


local ball_timer = 0
-- for number = 0, state.level do
--     Timer.after(1, function() print("Hello, world!") end)
--     local b = ball(10, 500, math.random(100, -300), math.random(-100, -300))
--     entities[#entities + 1] = b
-- end

love.draw = function()
    for _, entity in ipairs(entities) do
        if entity.draw then entity:draw() end
    end
end

love.keypressed = function(pressed_key)
    input.press(pressed_key)
end

love.keyreleased = function(released_key)
    input.release(released_key)
end

love.update = function(dt)
    -- ball_timer = ball_timer + dt
    -- if ball_timer >= 3 then
    --     local b = ball(10, 500, math.random(100, -300), math.random(-100, -300))
    --     entities[#entities + 1] = b
    --     ball_timer = 0
    -- end


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
        elseif entity.type == 'ball' and entity.caught then
            table.remove(entities, index)
            entity.fixture:destroy()
        else
            index = index + 1
        end
    end

    world:update(dt)
end
