local Stalk = require "stack"

local function new(stack_name, value)
   -- push the given value to a stack named by 'name'
   local pushstack = {}
   pushstack.stack_name = stack_name
   pushstack.value = value
   pushstack.process = function(self, cxt)
       if not cxt[self.stack_name] then
           cxt[self.stack_name] = Stack()
       end
       cxt[self.stack_name].push(value)
       return "success"
   end
   return pushstack
end
return new