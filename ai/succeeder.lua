local function new()
    local succeeder = {}
    succeeder.process = function(self, cxt)
        return "success"
    end
    return succeeder
end
return new