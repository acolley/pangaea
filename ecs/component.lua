local class = require "lib/middleclass"

local _current_id = 0

function _get_id()
    local id = _current_id
    _current_id = _current_id + 1
    return id
end

Component = class("Component")
function Component:initialize(entity_manager)
    self.type_id = _get_id()
    self.entity_manager = entity_manager
end

function Component:set_entity(entity)
    self.entity = entity
end