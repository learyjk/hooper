local state = require('state')

local press_functions = {
    left = function()
        state.button_left = true
    end,

    right = function()
        state.button_right = true
    end,

    up = function()
        state.button_up = true
    end,

    down = function()
        state.button_down = true
    end,

    escape = function()
        love.event.quit()
    end,
}

local release_functions = {
    left = function()
        state.button_left = false
    end,

    right = function()
        state.button_right = false
    end,

    up = function()
        state.button_up = false
    end,

    down = function()
        state.button_down = false
    end,
}

return {
    press = function(pressed_key)
        if press_functions[pressed_key] then
            press_functions[pressed_key]()
        end
    end,

    release = function(released_key)
        if release_functions[released_key] then
            release_functions[released_key]()
        end
    end,
}
