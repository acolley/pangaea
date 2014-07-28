require "lib/fez"

local Spatial = require "attributes/spatial"
local steering = require "attributes/steering"
local Transform = require "attributes/transform"

local SteeringAspect = Aspect("SteeringAspect")
function SteeringAspect:getComponents()
    -- TODO: add Spatial to get Entity bounding box
    -- and possibly a component that controls the 'physics'
    return { steering.Steering, Transform }
end

local SteeringController = Controller("SteeringController")
function SteeringController:onInit()
    self:setAspect(SteeringAspect)
end

function SteeringController:onUpdate(entity, dt)
    if entity.Steering.state == steering.SteeringState.Seek and entity.Steering.target then
        local direction = entity.Steering.target - entity.Transform.position
        direction:normalize_inplace()
        entity.Transform.position = entity.Transform.position + direction * entity.Steering.maxspeed * dt
    end
    -- we don't process 'idle' as there is nothing to do
end
return SteeringController