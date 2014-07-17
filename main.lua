require "lib/fez"

local Camera = require "camera"
local TileChunk = require "tilechunk"

local em = EntityManager()
local cm = ControllerManager()
local camera = Camera()

function love.load()
    local texture = love.graphics.newImage("assets/tileset.png")
    local width, height = 50, 50
    local tilewidth, tileheight = 32, 32
    local tiles = {}
    for y = 0, height - 1 do
        for x = 0, width - 1 do
            table.insert(tiles, x + y + 1, { x = x * tilewidth, y = y * tileheight, quad = love.graphics.newQuad(tilewidth, 0, tilewidth, tileheight, texture:getWidth(), texture:getHeight()) })
        end
    end
    tilechunk = TileChunk(0, 0, 50, 50, tiles, texture)
end

function love.draw()
    -- store current transformation on stack
    love.graphics.push()
    love.graphics.translate(camera.position.x, camera.position.y)
    love.graphics.scale(camera.size.x, camera.size.y)
    tilechunk:draw()
    love.graphics.pop()
end