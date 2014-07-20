require "lib/fez"

-- The Spatial component represents an Entity's
-- Spatial extens in the world, i.e. its bounding box
-- for render culling and update testing

Spatial = Attribute("Spatial")
function Spatial:onInit()
    self.bbox = 0
end