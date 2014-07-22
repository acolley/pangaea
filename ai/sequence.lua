function new(behaviours)
    local sequence = {}
    sequence.behaviours = behaviours
    sequence.behave = function(self, ...)
        local running = false
        for behaviour in self.behaviours do
            local status = behaviour:behave(...)
            if status == "failure" then
                return "failure"
            elseif status == "running" then
                running = true
        end
        if running then return "running"
        else return "success" end
    end
    return sequence
end
return new