local class = require "lua/middleclass"

SpriteSheet = class("SpriteSheet")
function SpriteSheet:initialize(image, metadata)
    self.image = image
    self.metadata = metadata
end

function SpriteSheet:getQuad(name)
    local quadData = self.metadata[name]
    return love.graphics.newQuad(quadData.x, 
                                 quadData.y, 
                                 quadData.width, 
                                 quadData.height, 
                                 self.image.getWidth(), 
                                 self.image.getHeight())
end

return SpriteSheet