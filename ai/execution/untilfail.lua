local function new(executorbt, model)
    local untilfail = {}
    untilfail.cxt = nil
    untilfail.behaviour = nil
    untilfail.executorbt = executorbt
    untilfail.model = model
    untilfail.init = function(self, cxt)
        self.cxt = cxt
        self.behaviour = self.model.behaviour:create_executor(self.executorbt)
        self.behaviour:init(cxt)
    end
    untilfail.process = function(self)
        local status = self.behaviour:process()
        if status == "failure" then
            return "success"
        elseif status == "success" then
            -- reset the behaviour on success
            self.behaviour:init(self.cxt)
        end
        return "running"
    end
    return untilfail
end
return new