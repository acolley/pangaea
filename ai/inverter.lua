function new(behaviour)
    local inverter = {}
    inverter.behaviour = behaviour
    inverter.behave = function(self, ...)
        local status = self.behaviour:behave(...)
        if status == "success" then
            return "failure"
        elseif status == "failure" then
            return "success"
        else
            return "running"
        end
    end
    return inverter
end
return new