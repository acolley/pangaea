local function new(name, value)
   -- this Node is for propagating variables
   -- upwards through the Behaviour tree
   local setvar = {}
   setvar.name = name
   setvar.value = value
   setvar.process = function(self, cxt)
       cxt[self.name] = self.value
       return "success"
   end
   return setvar
end
return new