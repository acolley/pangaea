local vector = require "lib/vector"

local AIAttribute = require "attributes/aiattribute"
local Sprite = require "attributes/sprite"
local Steering = require "attributes/steering"
local Transform = require "attributes/transform"

local Action = require "ai/action"
local Executor = require "ai/execution/executor"
local Seek = require "ai/actions/seek"
local Selector = require "ai/selector"
local SetVar = require "ai/setvar"
local Sequence = require "ai/sequence"

local function new(em, name, texture)
    -- TODO: replace texture with the spritesheet
    -- this actor will use, it will get its animation
    -- cells from the spritesheet using its name
    
    -- TODO: create an Executor that contains the persistent context
    -- that the behaviour tree should use when running, then pass the
    -- root behaviour to this to run continuously, however this will
    -- need to be created in the AiController.onUpdate method as this
    -- is the only point where it has access to the AI component
    local rootbehaviour = Sequence(SetVar("target", vector.new(500, 500)),
                                   Seek())

    local actor = em:createEntity(name)
    em:addComponentToEntity(actor, Transform())
    em:addComponentToEntity(actor, AIAttribute(rootbehaviour))
    em:addComponentToEntity(actor, Sprite(love.graphics.newQuad(14 * 32, 14 * 32, 32, 32, texture:getWidth(), texture:getHeight())))
    em:addComponentToEntity(actor, Steering(50))
    em:refreshEntity(actor)
    return actor
end
return new