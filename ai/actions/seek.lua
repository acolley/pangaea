local Action = require "ai/action"

local function new()
    -- the Seek Action requires the 'target'
    -- variable to be set on the context
    -- TODO: does the seek action need to keep
    -- track of when it's close enough to the
    -- target to return "success"?
    return Action(function(cxt)
        cxt.entity.Steering.state = "seek"
        cxt.entity.Steering.target = cxt.target
        return "running"
    end)
end
return new