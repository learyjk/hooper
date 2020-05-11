local world = require('world')

return function(x_pos, y_pos, x_vel, y_vel)

    local entity = {}
    entity.body = love.physics.newBody(world, x_pos, y_pos, 'dynamic')
    entity.body:setMass(0)
    entity.body:setLinearVelocity(x_vel, y_vel)
    entity.shape = love.physics.newCircleShape(0, 0, 5)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)
    entity.fixture:setFriction(0)
    entity.fixture:setRestitution(0.5)
    entity.fixture:setUserData(entity)

    entity.draw = function(self)
        local self_x, self_y = self.body:getWorldCenter()
        love.graphics.circle('fill', self_x, self_y, self.shape:getRadius())
    end

    return entity
end
