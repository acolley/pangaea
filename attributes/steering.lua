require "lib/fez"

local Steering = Attribute("Steering")
function Steering:onInit(maxspeed)
    self.maxspeed = maxspeed
    -- TODO: implement states as a simple state machine
    self.state = "idle"
    self.target = nil
    -- possible states are 'seek', 'follow' and 'idle'
end
return Steering