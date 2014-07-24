local function new(...)
    local sequence = {}
    sequence._index = 1
    sequence.behaviours = {...}
    sequence.process = function(self, cxt)
        local status = "success"
        while status == "success" and self._index <= #self.behaviours do
            status = self.behaviours[self._index]:process(cxt)
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
