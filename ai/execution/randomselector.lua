function new(executorbt, model)
    local randomselector = {}
    randomselector.cxt = nil
    randomselector._index = nil
    randomselector.behaviours = {}
    randomselector.executorbt = executorbt
    randomselector.model = model
    randomselector.init = function(self, cxt)
        self.cxt = cxt
        self._index = nil
        
        for i, behaviour in ipairs(self.model.behaviours) do
            local execbehaviour = behaviour:create_executor(self.executorbt)
            execbehaviour:init(cxt)
            table.insert(self.behaviours, execbehaviour)
        end
    end
    randomselector.process = function(self)
        if not self._index then
            self._index = math.random(#self.behaviours)
        return self.behaviours[self._index]:process()
    end
    return randomselector
end
return new