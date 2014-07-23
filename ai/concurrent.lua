local function new(behaviours, failure_threshold)
   -- visits all child nodes and processes 
   -- them in one iteration
   local concurrent = {}
   -- failure_threshold is the number of failures required
   -- to occur to make this node fail itself
   concurrent.failure_threshold = failure_threshold
   concurrent.behaviours = behaviours
   concurrent.process = function(self, cxt)
       local failures = 0
       local running = false
       for i, behaviour in ipairs(self.behaviours) do
           local status = behaviour:process(cxt)
           if status == "failure" then failures = failures + 1 end
           if failures >= self.failure_threshold then 
               return "failure"
           end
           if status == "running" then
               running = true
           end
       end
       if running then
           return "running"
       else
           return "success"
   end
   return concurrent
end