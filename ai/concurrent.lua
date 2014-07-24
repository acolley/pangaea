local function new(behaviours, succeed_all, fail_all)
    -- behaviours: the table-array of behaviours to process concurrently
    -- succeed_all: boolean 
    --     if true it means all child nodes should succeed before this node
    --     returns "success" otherwise only one node needs to return "success"
    -- fail_all : boolean
    --     if true it means all child nodes should fail before this node
    --     returns "failure" otherwise only one node needs to return "failure"

    -- influenced by http://aigamedev.com/open/article/parallel/

    -- note: this node is guaranteed to process all its child nodes
    -- at least once in a tick, even if the failure or success
    -- conditions are met during the tick

    -- visits all child nodes and processes 
    -- them in one iteration
    local concurrent = {}
    concurrent.succeed_all = succeed_all or false
    concurrent.fail_all = fail_all or false
    concurrent.behaviours = behaviours
    concurrent.process = function(self, cxt)
        local successes = 0
        local failures = 0
        for i, behaviour in ipairs(self.behaviours) do
            local status = behaviour:process(cxt)
            if status == "failure" then failures = failures + 1 end
            elseif status == "success" then successes = successes + 1 end
        end

        local status = "running"
        if succeed_all then
            if successes >= #self.behaviours then
                status = "success"
            end
        else
            if successes >= 1 then
                status = "success"
            end
        end

        -- failure overrides success
        if failure_all then
            if failures >= #self.behaviours then
                status = "failure"
            end
        else
            if failures >= 1 then
                status = "failure"
            end
        end
        return status
    end
    return concurrent
end
return new
