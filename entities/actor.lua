local vector = require "lib/vector"

local AIAttribute = require "attributes/aiattribute"
local Sprite = require "attributes/sprite"
local steering = require "attributes/steering"
local Transform = require "attributes/transform"

local Executor = require "ai/execution/executor"
local Repeater = require "ai/model/repeater"
local Seek = require "ai/actions/seek"
local Selector = require "ai/selector"
local SetVar = require "ai/model/setvar"
local Sequence = require "ai/model/sequence"

local function new(em, name, texture)
    -- TODO: replace texture with the spritesheet
    -- this actor will use, it will get its animation
    -- cells from the spritesheet using its name
    
    local root = Repeater(Sequence(SetVar("target", vector.new(500, 500)),
                                   Seek()))

    local actor = em:createEntity(name)
    em:addComponentToEntity(actor, Transform())
    em:addComponentToEntity(actor, AIAttribute(root))
    em:addComponentToEntity(actor, Sprite(love.graphics.newQuad(14 * 32, 14 * 32, 32, 32, texture:getWidth(), texture:getHeight())))
    em:addComponentToEntity(actor, steering.Steering(50))
    em:refreshEntity(actor)
    return actor
end
return new