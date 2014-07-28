local function new(executorbt, model)
    local inverter = {}
    inverter.cxt = nil
    inverter.behaviour = nil
    inverter.executorbt = executorbt
    inverter.model = model
    inverter.init = function(self, cxt)
        self.cxt = cxt
        self.behaviour = self.model.behaviour:create_executor(self.executorbt)
        self.behaviour:init(cxt)
    end
    inverter.process = function(self)
        local status = self.behaviour:process()
        if status == "success" then
            return "failure"
        elseif status == "failure" then
            return "success"
        end
        return "running"
    end
    return inverter
end
return new