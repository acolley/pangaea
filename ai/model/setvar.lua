local SetVarBehaviour = require "ai/execution/setvar"

local function new(name, value)
    -- this Node is for propagating variables
    -- upwards through the Behaviour tree
    local setvar = {}
    setvar.name = name
    setvar.value = value
    setvar.create_executor = function(self, executorbt)
        return SetVarBehaviour(executorbt, self)
    end
    return setvar
end
return new