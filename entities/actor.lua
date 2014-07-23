local vector = require "lib/vector"

local AIAttribute = require "attributes/aiattribute"
local Sprite = require "attributes/sprite"
local Steering = require "attributes/steering"
local Transform = require "attributes/transform"

local Action = require "ai/action"
local Seek = require "ai/actions/seek"
local Selector = require "ai/selector"
local SetVar = require "ai/setvar"
local Sequence = require "ai/sequence"

local function new(em, name, texture)
    -- TODO: replace texture with the spritesheet
    -- this actor will use, it will get its animation
    -- cells from the spritesheet using its name
    local rootbehaviour = Sequence(SetVar("target", vector.new(100, 100)),
                                   Seek())

    local actor = em:createEntity(name)
    em:addComponentToEntity(actor, Transform())
    em:addComponentToEntity(actor, AIAttribute(rootbehaviour))
    em:addComponentToEntity(actor, Sprite(love.graphics.newQuad(14 * 32, 14 * 32, 32, 32, texture:getWidth(), texture:getHeight())))
    em:addComponentToEntity(actor, Steering(20))
    em:refreshEntity(actor)
    return actor
end
return new