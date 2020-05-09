local world = require('world')

return function(x1, y1, x2, y2)
    entity = {}
    entity.body = love.physics.newBody(world, x_pos, y_pos, 'static')
    entity.shape = love.physics.newEdgeShape(x1, y1, x2, y2)
    entity.fixture = love.physics.newFixture(entity.body, entity.shape)

    entity.fixture:setUserData(entity)

end
