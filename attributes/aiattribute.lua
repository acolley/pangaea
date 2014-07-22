require "lib/fez"

local AIAttribute = Attribute("AIAttribute")
function AIAttribute:onInit(rootbehaviour)
    self.rootbehaviour = rootbehaviour
end
return AIAttribute