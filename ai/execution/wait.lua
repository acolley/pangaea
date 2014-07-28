local function new(executorbt, model)
    local wait = {}
    wait.start = nil
    wait.cxt = nil
    wait.executorbt = executorbt
    wait.model = model
    wait.init = function(self, cxt)
        self.cxt = cxt
    end
    wait.process = function(self)
        if self.start then
            if (love.timer.getTime() - self.start) * 1000 >= self.model.dt then
                return "success"
            end
        else
            self.start = love.timer.getTime()
        end
        return "running"
    end
    return wait
end
return new