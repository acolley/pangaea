local function new(predicate)
    local condition = {}
    condition.predicate = predicate
    condition.process = function(self, cxt)
        if self.predicate(cxt) then
            return "success"
        else
            return "failure"
        end
    end
    return condition
end
return new