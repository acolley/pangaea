local function new(n, behaviour)
    local repeater = {}
    repeater.n = n
    repeater.behaviour = behaviour
    repeater.process = function(self, cxt)
        if self.n == "inf" then
            return self.behaviour:process(cxt)
        end
        
        if self.n <= 0 then
            return "failure"
        else
            self.n = self.n - 1
            return self.behaviour:process(cxt)
        end
    end
    return repeater
end
return new