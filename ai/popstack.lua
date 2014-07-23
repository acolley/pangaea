local function new(stack_name, var_name)
   -- pop the value on the top of the stack into
   -- the variable named by 'var_name'
   local popstack = {}
   popstack.stack_name = stack_name
   popstack.var_name = var_name
   popstack.process = function(self, cxt)
       if cxt[self.stack_name].empty() then
           return "failure"
       else
           cxt[self.var_name] = cxt[self.stack_name].pop()
           return "success"
       end
   end
   return popstack
end
return new