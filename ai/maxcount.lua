local function new(behaviour, n)
    -- this node runs its behaviour the
    -- maximum number of times given by 'n'
    local maxcount = {}
    maxcount._count = 0
    maxcount.n = n
    maxcount.behaviour = behaviour
    maxcount.process = function(self, cxt)
        if self._count >= self.n then
            return "success"

        self._count = self._count + 1
        return self.behaviour:process(cxt)
    end
    return maxcount
end
return new
