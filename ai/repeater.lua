function new(n, behaviour)
    local repeater = {}
    repeater.n = n
    repeater.behaviour = behaviour
    repeater.behave = function(self, ...)
        if self.n == "inf" then
            return self.behaviour.behave(...)
        end
        
        if self.n <= 0 then
            return "failure"
        else
            self.n = self.n - 1
            return self.behaviour.behave(...)
        end
    end
    return repeater
end
return new