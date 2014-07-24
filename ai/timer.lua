local function new(behaviour, n)
    -- this node runs its behaviour when
    -- it has been called n-times, then it resets
    -- and does it again
    local timer = {}
    -- call it first time through
    timer._count = n
    timer.n = n
    timer.behaviour = behaviour
    timer.process = function(self, cxt)
        if self._count >= self.n then
            self._count = 0
            return self.behaviour:process(cxt)
        else
            self._count = self._count + 1
        end
        return "running"
    end
    return timer
end
return new
