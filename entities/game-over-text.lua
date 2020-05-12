local state = require('state')

return function()
    local window_width, window_height = love.window.getMode()

    local entity = {}

    entity.draw = function(self)
        if state.game_over then
            love.graphics.print({state.palette[1], 'GAME OVER!'},
                math.floor(window_width / 2) - 100,
                math.floor(window_height / 2),
                0,
                2,
                2
            )
            love.graphics.print({state.palette[1], 'press r to restart'},
                math.floor(window_width / 2) - 100,
                math.floor(window_height / 2) + 25
            )
        end
    end

    return entity
end
