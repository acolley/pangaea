local function new(...)
    local selector = {}
    selector.behaviours = {...}
    selector.process = function(self, cxt)
        --if arg[#arg] == "-debug" then require("mobdebug").start() end
        for i, behaviour in ipairs(self.behaviours) do
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