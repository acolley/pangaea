local WaitBehaviour = require "ai/execution/wait"

function new(behaviour, dt)
    local wait = {}
    wait.cxt = nil
    wait.behaviour = behaviour
    wait.dt = dt
    wait.create_executor = function(self, executorbt)
        return WaitBehaviour(executorbt, self)
    end
    return wait
end
return new