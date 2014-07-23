local function new(behaviours)
   local sequence = {}
   sequence.index = 1
   sequence.behaviours = behaviours
   sequence.process = function(self, cxt)
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