function new(behaviours)
    local selector = {}
    selector.behaviours = behaviours
    selector.behave = function(self, ...)
        for behaviour in self.behaviours do
            local status = behaviour.behave()
            if status == "success" or status == "running" then
                return status
            end
        end
    end
    return selector
end
return new