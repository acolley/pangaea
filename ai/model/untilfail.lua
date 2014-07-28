local UntilFailBehaviour = require "ai/execution/untilfail"

local function new(behaviour)
    local untilfail = {}
    untilfail.behaviour = behaviour
    untilfail.create_executor = function(self, executorbt)
    end
    untilfail.process = function(self, cxt)
        local status = self.behaviour:process(cxt)
        if status == "failure" then
            return "success"
        else
            return "running"
        end
    end
    return untilfail
end
return new