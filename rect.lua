local vector = require "lib/vector"

function new(min, max)
    local rect = { 
        min = min, 
        max = max,
        contains = function(point)
        end
    }
end
return new