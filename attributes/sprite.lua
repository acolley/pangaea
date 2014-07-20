require "lib/fez"

local vector = require "lib/vector"

local Sprite = Attribute("Sprite")
function Sprite:onInit(quad, origin)
    self.quad = quad
    x, y, w, h = quad:getViewport()
    self.origin = origin or vector.new(quad, w / 2, h / 2)
end
return Sprite