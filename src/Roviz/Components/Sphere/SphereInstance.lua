local SphereInstance = {}
SphereInstance.__index = SphereInstance

function SphereInstance.new(config: {[string] : any}, baseTrove)
    local self = setmetatable({}, SphereInstance)

    self._trove = baseTrove:Extend()

    return self
end

function SphereInstance:Render()

end

return SphereInstance