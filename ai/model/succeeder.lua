local SucceederBehaviour = require "ai/execution/succeeder"

local function new(behaviour)
    local succeeder = {}
    succeeder.behavour = behaviour
    succeeder.create_executor = function(self, executorbt)
        return SucceederBehaviour(executorbt, self)
    end
    return succeeder
end
return new