local state = require('state')
local world = require('world')

return function()
    entity = {}
    local window_width, window_height = love.window.getMode()
    local width = 60
    local height = 40
    local speed = 500

    local right_boundary = (window_width - width) - 1
    local left_boundary = 1
    local bottom_boundary = (window_height - height) - 100
    local top_boundary = 2

    --chain shape
    entity.body = love.physics.newBody(world, 20, 20, 'dynamic')
    entity.shape = love.physics.newChainShape(false, 0, 0, 0, height, width, height, width, 0)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setFriction(1)
    entity.fixture:setUserData('entity')

    entity.draw = function(self)
        love.graphics.line(self.body:getWorldPoints(self.shape:getPoints()))

        --debug
        -- love.graphics.setColor(state.palette[1])
        -- local x_center, y_center = self.body:getX(), self.body:getY()
        -- love.graphics.circle('fill', x_center + width/2, y_center + height/2, 1)
        -- love.graphics.setColor(state.palette[5])
    end

    entity.update = function(self)
        local x_pos = self.body:getX()
        local y_pos = self.body:getY()

        if state.button_left and x_pos > left_boundary then
            self.body:setLinearVelocity(-speed, 0)
        elseif state.button_right and x_pos < right_boundary then
            self.body:setLinearVelocity(speed, 0)
        elseif state.button_down and y_pos < bottom_boundary then
            self.body:setLinearVelocity(0, speed)
        elseif state.button_up and y_pos > top_boundary then
            self.body:setLinearVelocity(0, -speed)
        else
            self.body:setLinearVelocity(0, 0)
        end
    end

    entity.getWidth = function(self)
        return width
    end

    entity.getHeight = function(self)
        return height
    end

    return entity
end
