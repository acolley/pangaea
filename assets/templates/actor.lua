require "lib/fez"

local AIAttribute = require "attributes/aiattribute"
local Transform = require "attributes/transform"

-- This creates a new Actor Entity with the required
-- Components and returns the id created via the supplied EntityManager
function new(em)
    local entity = em.createEntity()
    em.addComponentToEntity(entity, AIAttribute())
    em.addComponentToEntity(entity, Transform())
    return entity
end
return new