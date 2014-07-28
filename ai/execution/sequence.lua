local function new(executorbt, model)
    local sequence = {}
    sequence._index = 1
    sequence.cxt = nil
    sequence.behaviours = {}
    sequence.executorbt = executorbt
    sequence.model = model
    sequence.init = function(self, cxt)
        self.cxt = cxt
        
        -- TODO: create all of them here or create them
        -- on demand in the process function? This would
        -- make it match the JBT behaviour
        for i, behaviour in ipairs(self.model.behaviours) do
            local execbehaviour = behaviour:create_executor(self.executorbt)
            execbehaviour:init(cxt)
            table.insert(self.behaviours, execbehaviour)
        end
    end
    sequence.process = function(self)
        local status = "success"
        while status == "success" and self._index <= #self.behaviours do
            status = self.behaviours[self._index]:process()
            if status == "success" then
                self._index = self._index + 1
            end
        end
        if status == "failure" or self._index > #self.behaviours then
            self._index = 1
        end
        return status
    end
    return sequence
end
return new
