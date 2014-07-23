local function new()
   local stack = {}
   stack._data = {}
   stack.push = function(self, value)
       table.insert(self._data, value)
   end
   stack.empty = function(self)
       return #self._data <= 0
   end
   stack.pop = function(self)
       return table.remove(self._data)
   end
   stack.peek = function(self)
       return self._data[#self._data]
   end
   return stack
end
return new