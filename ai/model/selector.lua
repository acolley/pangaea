local SelectorBehaviour = require "ai/execution/selector"

local function new(...)
    local selector = {}
    selector._index = 1
    selector.behaviours = {...}
    selector.create_selector = function(self, executorbt)
        return SelectorBehaviour(executorbt, self)
    end
    return selector
end
return new
