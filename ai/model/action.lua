local ActionBehaviour = require "ai/execution/action"

local function new(func)
    local action = {}
    action.func = func
    action.create_executor = function(self, executorbt)
        return ActionBehaviour(executorbt, self)
    end
    return action
end
return new