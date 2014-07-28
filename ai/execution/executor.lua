function new(model, cxt)
    local executor = {}
    executor.model = model
    executor.cxt = cxt or {}
    executor._firsttick = true
    executor.execution = nil
    executor.process = function(self)
        if self._firsttick then
            self.execution = self.model:create_executor(self)
            self.execution:init(self.cxt)
            self._firsttick = false
        end
        return self.execution:process()
    end
    return executor
end
return new