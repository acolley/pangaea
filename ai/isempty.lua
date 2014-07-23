local function new(stack_name)
   local isempty = {}
   isempty.stack_name = stack_name
   isempty.process = function(self, cxt)
       if not cxt[self.stack_name] or cxt[self.stack_name].empty() then
           return "success"
       else
           return "failure"
       end
   end
   return isempty
end
return new