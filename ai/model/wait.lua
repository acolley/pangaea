local WaitBehaviour = require "ai/execution/wait"

function new(dt)
    -- dt : time in milliseconds to wait for
    local wait = {}
    wait.cxt = nil
    wait.dt = dt
    wait.create_executor = function(self, executorbt)
        return WaitBehaviour(executorbt, self)
    end
    return wait
end
return new