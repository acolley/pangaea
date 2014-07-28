local function new(executorbt, model)
    local condition = {}
    condition.cxt = nil
    condition.model = model
    condition.init = function(self, cxt)
        self.cxt = cxt
    end
    condition.process = function(self)
        if self.model.predicate(self.cxt) then
            return "success"
        else
            return "failure"
        end
    end
    return condition
end
return new