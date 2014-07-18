local class = require "lib/middleclass"
local vector = require "lib/vector"

Camera = class("Camera")
function Camera:initialize()
    self.position = vector.new(0, 0)
    self.rotation = 0
    self.size = vector.new(1, 1)
end

function Camera:move(dx, dy)
    self.position.x = self.position.x + dx
    self.position.y = self.position.y + dy
end

return Camera