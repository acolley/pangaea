require "lib/fez"

local mod = {}

local SteeringState = {
    ["Idle"] = 0,
    ["Seek"] = 1,
    ["Follow"] = 2
}
mod.SteeringState = SteeringState

local Steering = Attribute("Steering")
function Steering:onInit(maxspeed)
    self.maxspeed = maxspeed
    -- TODO: implement states as a simple state machine
    self.state = SteeringState.Idle
    self.target = nil
    -- possible states are 'seek', 'follow' and 'idle'
end
mod.Steering = Steering

return mod