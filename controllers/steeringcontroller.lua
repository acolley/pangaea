require "lib/fez"

local Spatial = require "attributes/spatial"
local Steering = require "attributes/steering"
local Transform = require "attributes/transform"

local SteeringAspect = Aspect("SteeringAspect")
function SteeringAspect:getComponents()
    -- TODO: add Spatial to get Entity bounding box
    -- and possibly a component that controls the 'physics'
    return { Steering, Transform }
end

local SteeringController = Controller("SteeringController")
function SteeringController:onInit()
    self:setAspect(SteeringAspect)
end

function SteeringController:onUpdate(entity, dt)
    if entity.Steering.state == "seek" and entity.Steering.target then
        local direction = entity.Steering.target - entity.Transform.position
        direction:normalize_inplace()
        entity.Transform.position = entity.Transform.position + direction * entity.Steering.maxspeed * dt
    end
    -- we don't process 'idle' as there is nothing to do
end
return SteeringController