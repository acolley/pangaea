local function new(executorbt, model)
    local repeater = {}
    repeater.cxt = nil
    repeater.behaviour = nil
    repeater.model = model
    repeater.executorbt = executorbt
    repeater.init = function(self, cxt)
        self.cxt = cxt
        self.behaviour = self.model.behaviour:create_executor(self.executorbt)
        self.behaviour:init(cxt)
    end
    repeater.process = function(self)
        -- if the child has finished, spawn again
        local status = self.behaviour:process()
        if status ~= "running" then
            self.behaviour:init(self.cxt)
        end
        return "running"
    end
    return repeater
end
return new