local function new(behaviours)
    local randomselector = {}
    randomselector.behaviours = behaviours
    randomselector.process = function(self, cxt)
        local index = math.random(#self.behaviours)
        return self.behaviours[index]:process(cxt)
    end
    return randomselector
end
return new