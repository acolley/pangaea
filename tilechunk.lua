local class = require "lib/middleclass"

TileChunk = class("TileChunk")
function TileChunk:initialize(x, y, width, height, tiles, texture)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.tiles = tiles
    self.spritebatch = love.graphics.newSpriteBatch(texture, width * height, "static")
    for i, tile in ipairs(self.tiles) do
        self.spritebatch:add(tile.quad, tile.x, tile.y)
    end
end

function TileChunk:draw()
    love.graphics.draw(self.spritebatch, self.x, self.y)
end
return TileChunk