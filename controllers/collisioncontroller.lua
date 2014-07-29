require "lib/fez"
local bump = require "lib/bump"

local Collision = require "attributes/collision"
local Transform = require "attributes/transform"

local CollisionAspect = Aspect("CollisionAspect")
function CollisionAspect:getComponents()
    return {
        Collision,
        Transform
    }
end

local CollisionController = Controller("CollisionController")
function CollisionController:onInit()
    self:setAspect(CollisionAspect)
    self.world = bump.newWorld()
end

function CollisionController:onUpdate(entity)
    -- check for collisions
    local cols, len = self.world:check(entity.Collision,
                                       entity.Transform.position.x,
                                       entity.Transform.position.y)
    
    if len == 0 then
        self.world:move(entity.Collision, 
                        entity.Transform.position.x, 
                        entity.Transform.position.y)
    else
        -- TODO: implement collision layer testing in the Controller attribute
        -- so collisions can be filtered if needed
        -- collisions are sorted by proximity, so first
        -- collision is the nearest
        local dx, dy = collisions[1]:getTouch()
        self.world:move(entity.Collision, dx, dy)
    end
end
return CollisionController