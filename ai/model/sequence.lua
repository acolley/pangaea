local SequenceBehaviour = require "ai/execution/sequence"

function new(...)
    local sequence = {}
    sequence.behaviours = {...}
    sequence.create_executor = function(self, executorbt)
        return SequenceBehaviour(executorbt, self)
    end
    return sequence
end
return new