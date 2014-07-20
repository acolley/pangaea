require "lib/fez"

local Transform = require "attributes/transform"
local Sprite = require "attributes/sprite"

local SpriteAspect = Aspect("SpriteAspect")
function SpriteAspect:getComponents()
    return { Sprite, Transform }
end

SpriteController = Controller("SpriteController")
function SpriteController:onInit()
    self:setAspect(SpriteAspect)
    self.spritebatch = love.graphics.newSpriteBatch(love.graphics.newImage("assets/tileset.png"), 1000, "stream")
end

function SpriteController:onControllersRefresh(cm)
    self.cm = cm
end

function SpriteController:onUpdateAll(entities)
    -- TODO: use dt for animated sprites
    self.spritebatch:clear()
    for entity in entities do
        local sprite = self.cm.entityManager:getComponentFromEntity(entity, Sprite)
        local transform = self.cm.entityManager:getComponentFromEntity(entity, Transform)
        self.spritebatch:add(sprite.quad,
                             transform.position.x,
                             transform.position.y,
                             transform.rotation,
                             1, 1,
                             sprite.origin.x,
                             sprite.origin.y)
    end
    love.graphics.draw(self.spritebatch)
end
return SpriteController