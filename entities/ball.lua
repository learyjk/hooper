local world = require('world')
local state = require('state')

return function(x_pos, y_pos, x_vel, y_vel)

    local entity = {}
    local window_width, window_height = love.window.getMode()

    entity.type = 'ball'
    entity.dead = false
    entity.caught = false

    entity.body = love.physics.newBody(world, x_pos, y_pos, 'dynamic')
    entity.body:setBullet(true)
    entity.body:setLinearVelocity(x_vel, y_vel)
    entity.shape = love.physics.newCircleShape(0, 0, 5)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setRestitution(0.75)
    entity.fixture:setUserData(entity)

    entity.draw = function(self)
        local self_x, self_y = self.body:getWorldCenter()
        love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
    end

    entity.update = function(self, dt, basket)
        -- check if at bottom cneter of screen "dead zone"
        local ball_x, ball_y = self.body:getWorldCenter()
        if ball_y > (window_height - 10) and ball_x > (window_width/2 - 10) and ball_x < (window_width/2 + 10) then
            self.dead = true
        end

        -- check if in basket
        local basket_center_y  = math.floor(basket.body:getY() + basket:getHeight()/2)
        local ball_x, ball_y = self.body:getX(), self.body:getY()

        if ball_y > basket_center_y and ball_y < (basket.body:getY() + basket:getHeight()) then
            if ball_x > basket.body:getX() and ball_x < (basket.body:getX() + basket.getWidth()) then
                self.caught = true
            end
        end
    end

    entity.ball_in_basket = function(self, basket)

    end

    return entity
end
