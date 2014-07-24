-- The WorldGen function is for creating generating a new world
-- for the game to take place in

local function WorldCell()
    local cell = {}
    return cell
end

local function new(width, height)
    -- the width and height specify the dimensions of the
    -- world in terms of the world cells that make it up
    local world = {}
    world.cells = {}
    for x = 1, width do
        local col = {}
        for y = 1, height do
            table.insert(col, WorldCell())
        end
        table.insert(world.cells, col)
    end
    world.getcell = function(self, x, y)
        return self.cells[y][x]
    end
    world.setcell = function(self, x, y, cell)
        self.cells[y][x] = cell
    end
    return world
end
return new