local entities = require('entities')
local input = require('input')
local state = require('state')
local world = require('world')

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
    local index = 1
    while index <= #entities do
        local entity = entities[index]



        if entity.update then
            entity:update(dt)
        end

        if entity.type == 'ball' and entity.dead then
            table.remove(entities, index)
            entity.fixture:destroy()
        else
            index = index + 1
        end
    end

    world:update(dt)
end
