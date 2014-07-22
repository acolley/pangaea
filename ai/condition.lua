function new(predicate)
    local condition = {}
    condition.predicate = predicate
    condition.behave = function(self, ...)
        if self.predicate(...) then
            return "success"
        else
            return "failure"
        end
    end
    return condition
end
return new