local ConditionBehaviour = require "ai/execution/condition"

local function new(predicate)
    local condition = {}
    condition.predicate = predicate
    condition.create_executor = function(self, executorbt)
        return ConditionBehaviour(executorbt, self)
    end
    return condition
end
return new