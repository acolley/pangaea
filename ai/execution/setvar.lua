local function new(executorbt, model)
    local setvar = {}
    setvar.cxt = nil
    setvar.model = model
    setvar.init = function(self, cxt)
        self.cxt = cxt
    end
    setvar.process = function(self)
        self.cxt[self.model.name] = self.model.value
        return "success"
    end
    return setvar
end
return new