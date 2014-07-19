require "lib/fez"
local vector = "lib/vector"

local Transform = Component("Transform")
function Transform:onInit()
    self.position = vector.new(0, 0)
    self.rotation = 0 -- TODO: change this to a facing vector instead
end
return Transform