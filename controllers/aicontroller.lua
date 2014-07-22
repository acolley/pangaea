require "lib/fez"

local AIAttribute = require "attributes/aiattribute"
local Transform = require "attributes/transform"

local AIAspect = Aspect("AIAspect")
function AIAspect:getComponents()
    return {
        AIAttribute,
        Transform
    }
end

local AIController = Controller("AIController")
function AIController:onInit()
    self:setAspect(AIAspect)
end

function AIController:onUpdate(entity, dt)
    --aspect.Transform.position.x = aspect.Transform.position.x + 1
    --entity.AIAttribute.rootbehaviour.behave(dt)
end
return AIController