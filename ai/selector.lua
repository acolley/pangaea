local function new(behaviours)
    local selector = {}
    selector.behaviours = behaviours
    selector.process = function(self, cxt)
        for behaviour in self.behaviours do
            -- TODO: change to process behaviours as coroutines?
            local status = behaviour:process(cxt)
            if status == "success" or status == "running" then
                return status
            end
        end
        return "failure"
    end
    return selector
end
return new