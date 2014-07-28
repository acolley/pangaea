local RepeaterBehaviour = require "ai/execution/repeater"

local function new(behaviour)
    local repeater = {}
    repeater.behaviour = behaviour
    repeater.create_executor = function(self, executorbt)
        return RepeaterBehaviour(executorbt, self)
    end
    return repeater
end
return new