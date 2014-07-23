local function new(...)
   local sequence = {}
   sequence.index = 1
   sequence.behaviours = {...}
   sequence.process = function(self, cxt)
       --if arg[#arg] == "-debug" then require("mobdebug").start() end
       local status = "success"
       while status == "success" and self.index <= #self.behaviours do
           status = self.behaviours[self.index]:process(cxt)
           self.index = self.index + 1
       end
       if status == "failure" then
           self.index = 1
       end
       return status
   end
   return sequence
end
return new