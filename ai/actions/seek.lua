local Action = require "ai/model/action"
local steering = require "attributes/steering"

local function new()
    -- the Seek Action requires the 'target'
    -- variable to be set on the context
    -- TODO: does the seek action need to keep
    -- track of when it's close enough to the
    -- target to return "success"?
    return Action(function(cxt)
        -- or should it get the top value off a stack?
        cxt.entity.Steering.state = steering.SteeringState.Seek
        cxt.entity.Steering.target = cxt.target
        return "success"
    end)
end
return new