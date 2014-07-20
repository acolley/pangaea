local class = require "lib/middleclass"
local vector = require "lib/vector"

function round(num, idp)
    local mult = 10 ^ (idp or 0)
    return math.floor(num * mult + 0.5) / mult
end

Camera = class("Camera")
function Camera:initialize()
    self.position = vector.new(0, 0)
    self.rotation = 0
    self.size = vector.new(1, 1)
end

function Camera:move(dx, dy)
    self.position.x = self.position.x + dx
    self.position.y = self.position.y + dy
    
    -- keep the camera to whole pixel coordinates
    -- to avoid 'gaps' between sprites that are
    -- located exactly next to each other
    -- this may result in odd motion so consider
    -- another solution if needed
    self.position.x = round(self.position.x)
    self.position.y = round(self.position.y)
end
return Camera