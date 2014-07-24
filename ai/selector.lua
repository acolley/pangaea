local function new(...)
    local selector = {}
    selector._index = 1
    selector.behaviours = {...}
    selector.process = function(self, cxt)
        --if arg[#arg] == "-debug" then require("mobdebug").start() end
        -- loop around until we process a node that doesn't fail
        -- this provides the 'fallback' functionality of a selector node
        local status = "failure"
        while status == "failure" and self._index <= #self.behaviours do
            status = self.behaviors[self._index]:process(cxt)
            if status == "failure" then
                self._index = self._index + 1
            end
        end
        -- TODO: maybe this should be in an 'init()' method?
        -- an init() would make it possible to reset() child nodes
        -- as well, when this node has finished
        if self._index > #self.behaviours then
            self._index = 1
        end
        return status
    end
    return selector
end
return new
