function new()
    local succeeder = {}
    succeeder.behave = function(self, ...)
        return "success"
    end
    return succeeder
end