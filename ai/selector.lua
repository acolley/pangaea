function new(behaviours)
    local selector = {}
    selector.behaviours = behaviours
    selector.behave = function(self, ...)
        for behaviour in self.behaviours do
            -- TODO: change to process behaviours as coroutines?
            local status = behaviour:behave(...)
            if status == "success" or status == "running" then
                return status
            end
        end
        return "failure"
    end
    return selector
end
return new