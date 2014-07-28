local function new(executorbt, model)
    local selector = {}
    selector.cxt = nil
    selector._index = 1
    selector.behaviours = {}
    selector.executorbt = executorbt
    selector.model = model
    selector.init = function(self, cxt)
        self.cxt = cxt
        self._index = 1
        for i, behaviour in ipairs(self.behaviours) do
            local execbehaviour = behaviour:create_executor(self.executorbt)
            execbehaviour:init(cxt)
            table.insert(self.behaviours, execbehaviour)
        end
    end
    selector.process = function(self)
        -- loop around until we process a node that doesn't fail
        -- this provides the 'fallback' functionality of a selector node
        local status = "failure"
        while status == "failure" and self._index <= #self.behaviours do
            status = self.behaviors[self._index]:process()
            if status == "failure" then
                self._index = self._index + 1
            end
        end
        return status
    end
    return selector
end
return new