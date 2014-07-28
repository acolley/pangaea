local function new(executorbt, model)
    local action = {}
    action.cxt = nil
    action.executorbt = executorbt
    action.model = model
    action.init = function(self, cxt)
        self.cxt = cxt
    end
    action.process = function(self)
        return self.model.func(self.cxt)
    end
    return action
end
return new