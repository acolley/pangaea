require "lib/fez"

local Collision = Attribute("Collision")
function Collision:onInit(width, height, layer)
    self.width = width or 0
    self.height = height or 0
    self.layer = layer or 0 -- TODO: set to maximum number
end
return Collision