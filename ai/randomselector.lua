function new(behaviours)
    local randomselector = {}
    randomselector.behaviours = behaviours
    randomselector.behave = function(self, ...)
        local index = math.random(#self.behaviours)
        return self.behaviours[index]:behave(...)
    end
    return randomselector
end
return new