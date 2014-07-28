require "lib/fez"

local vector = require "lib/vector"

local AIAttribute = require "attributes/aiattribute"
local Executor = require "ai/execution/executor"
local steering = require "attributes/steering"
local Transform = require "attributes/transform"

local AIAspect = Aspect("AIAspect")
function AIAspect:getComponents()
    return {
        AIAttribute,
        steering.Steering,
        Transform
    }
end

local AIController = Controller("AIController")
function AIController:onInit()
    self:setAspect(AIAspect)
    self._firstupdate = true
end

function AIController:onUpdate(entity, dt)
    -- TODO: update entities every 20/30 frames to
    -- reduce CPU load. Make sure to spread each entity
    -- out so they don't all process at once
    if self._firstupdate then
        local context = { ["entity"] = entity }
        entity.AIAttribute.root = Executor(entity.AIAttribute.rootmodel, context)
        self._firstupdate = false
    end
    if entity.AIAttribute.root:process() ~= "running" then
        -- TODO: debugging?
    end
end
return AIController