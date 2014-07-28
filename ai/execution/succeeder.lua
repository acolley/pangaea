local function new(executorbt, model)
    local succeeder = {}
    succeeder.cxt = nil
    succeeder.behaviour = nil
    succeeder.executorbt = executorbt
    succeeder.model = model
    succeeder.init = function(self, cxt)
        self.cxt = cxt
        self.behaviour = self.model.behaviour:create_executor(self.executorbt)
        self.behaviour:init(cxt)
    end
    succeeder.process = function(self)
        if self.behaviour:process() ~= "running" then
            return "success"
        return "running"
    end
    return succeeder
end
return new