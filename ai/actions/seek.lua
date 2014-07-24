local Action = require "ai/action"

local function new()
    -- the Seek Action requires the 'target'
    -- variable to be set on the context
    -- TODO: does the seek action need to keep
    -- track of when it's close enough to the
    -- target to return "success"?
    return Action(function(cxt)
        -- or should it get the top value off the stack?
        cxt.entity.Steering.state = "seek"
        cxt.entity.Steering.target = cxt.target
        return "success"
    end)
end
return new