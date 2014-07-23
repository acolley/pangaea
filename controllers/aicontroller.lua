require "lib/fez"

local AIAttribute = require "attributes/aiattribute"
local Steering = require "attributes/steering"
local Transform = require "attributes/transform"

local AIAspect = Aspect("AIAspect")
function AIAspect:getComponents()
    return {
        AIAttribute,
        Steering,
        Transform
    }
end

local AIController = Controller("AIController")
function AIController:onInit()
    self:setAspect(AIAspect)
end

function AIController:onUpdate(entity, dt)
    -- TODO: update entities every 20/30 frames to
    -- reduce CPU load. Make sure to spread each entity
    -- out so they don't all process at once
    entity.AIAttribute.rootbehaviour:process({ ["entity"] = entity })
end
return AIController