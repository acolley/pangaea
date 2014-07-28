require "lib/fez"

local AIAttribute = Attribute("AIAttribute")
function AIAttribute:onInit(rootmodel)
    self.rootmodel = rootmodel
    self.root = nil
end
return AIAttribute