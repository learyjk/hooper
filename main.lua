local world = require('world')
local entities = require('entities')

love.draw = function()
  for _, entity in ipairs(entities) do
    if entity.draw then entity:draw() end
  end
end

love.update = function(dt)
    world:update(dt)
end
