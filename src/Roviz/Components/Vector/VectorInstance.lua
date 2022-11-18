local VectorInstance = {}
VectorInstance.__index = VectorInstance

function VectorInstance.new(config: {[string] : any}, baseTrove)
    local self = setmetatable({}, VectorInstance)

    self._trove = baseTrove:Extend()

    return self
end

function VectorInstance:Render()

end

return VectorInstance