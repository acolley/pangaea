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

function AIController:onControllersRefresh(cm)
    -- store references here for faster lookup later
    -- get other related controllers or components if needed
end

function AIController:onUpdate(aspect, dt)
    aspect.Transform.position.x = aspect.Transform.position.x + 1
end
return AIController