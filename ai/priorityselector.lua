local function new(behaviours)
   -- a priority selector processes its child nodes in the order
   -- given by an associated priority value, the higher this value
   -- the more priority the behaviour has, each element in the
   -- 'behaviours' table should be a pair of (priority, behaviour)
   local priorityselector = {}
   priorityselector.behaviours = behaviours
   priorityselector.process = function(self, cxt)
       -- TODO: reset a previously running node if it does not
       -- get processed this time around as something higher
       -- priority is going to be processed instead?

       -- sort in descending order, i.e. first has highest priority
       -- and last has lowest priority
       local sorted = ipairs(table.sort(self.behaviours, function(a, b) a[0] > b[0] end))
       local status = "success"
       local i = 1
       while status == "success" and i <= #self.behaviours do
           status = sorted[i][1]:process(cxt)
           i = i + 1
       return status
   end
   return priorityselector
end
return new