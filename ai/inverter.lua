local function new(behaviour)
    local inverter = {}
    inverter.behaviour = behaviour
    inverter.process = function(self, cxt)
        local status = self.behaviour:process(cxt)
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