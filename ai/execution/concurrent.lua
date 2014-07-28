local function new(executorbt, model)
    local concurrent = {}
    concurrent.cxt = nil
    concurrent.behaviours = {}
    concurrent.executorbt = executorbt
    concurrent.model = model
    concurrent.init = function(self, cxt)
        self.cxt = cxt
        
        for i, behaviour in ipairs(self.behaviours) do
            local execbehaviour = behaviour:create_executor(self.executorbt)
            execbehaviour:init(self.cxt)
            table.insert(self.behaviours, execbehaviour)
        end
    end
    concurrent.process = function(self)
        local successes = 0
        local failures = 0
        
        for i, behaviour in ipairs(self.behaviours) do
            local status = behaviour:process()
            if status == "failure" then 
                failures = failures + 1
            elseif status == "success" then 
                successes = successes + 1
            end
        end
        
        local status = "running"
        if self.model.succeed_all then
            if successes >= #self.behaviours then
                status = "success"
            end
        else
            if successes >= 1 then
                status = "success"
            end
        end
        
        -- failure overrides success
        if failure_all then
            if failures >= #self.behaviours then
                status = "failure"
            end
        else
            if failures >= 1 then
                status = "failure"
            end
        end
        return status
    end
    return concurrent
end
return new