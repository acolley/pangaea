require "lib/fez"
local vector = require "lib/vector"

local Camera = require "camera"
local TileChunk = require "tilechunk"

local AIController = require "controllers/aicontroller"
local SpriteController = require "controllers/spritecontroller"
local SteeringController = require "controllers/steeringcontroller"

local Transform = require "attributes/transform"

local Actor = require "entities/actor"

local em = EntityManager()
local cm = ControllerManager()
local camera = Camera()

function love.load()
    --if arg[#arg] == "-debug" then require("mobdebug").start() end
    love.window.setMode(1280, 800)
    
    local texture = love.graphics.newImage("assets/tileset.png")
    local width, height = 50, 50
    local tilewidth, tileheight = 32, 32
    local tiles = {}
    for y = 0, height - 1 do
        for x = 0, width - 1 do
            table.insert(tiles, x + y + 1, { x = x * tilewidth, y = y * tileheight, quad = love.graphics.newQuad(0, 640, tilewidth, tileheight, texture:getWidth(), texture:getHeight()) })
        end
    end
    tilechunk = TileChunk(0, 0, 50, 50, tiles, texture)

    aiController = AIController(cm)
    spriteController = SpriteController(cm)
    steeringController = SteeringController(cm)

    -- create entities
    local robot = Actor(em, "robot", texture)

    cm:refresh()
end

function love.update(dt)
    local direction = vector.new(0, 0)
    local speed = 1000
    if love.keyboard.isDown("up") then
        direction.y = 1
    end
    if love.keyboard.isDown("down") then
        direction.y = -1
    end
    if love.keyboard.isDown("left") then
        direction.x = 1
    end
    if love.keyboard.isDown("right") then
        direction.x = -1
    end
    if direction ~= vector.zero then
        local move = direction:normalize_inplace() * speed * dt
        camera:move(move.x, move.y)
    end

    aiController:update(dt)
    steeringController:update(dt)
end

function love.draw()
    -- store current transformation on stack
    love.graphics.push()
    love.graphics.translate(camera.position.x, camera.position.y)
    love.graphics.scale(camera.size.x, camera.size.y)
    tilechunk:draw()
    spriteController:update()
    love.graphics.pop()
end