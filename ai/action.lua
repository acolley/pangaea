local function new(func)
    local action = {}
    action.func = func
    action.process = function(self, cxt)
        return self.func(cxt)
    end
    return action
end
return new