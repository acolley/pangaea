local InverterBehaviour = require "ai/execution/inverter"

local function new(behaviour)
    local inverter = {}
    inverter.behaviour = behaviour
    inverter.create_executor = function(self, executorbt)
        return InverterBehaviour(executorbt, self)
    end
    return inverter
end
return new