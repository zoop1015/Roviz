local VectorStatic = {}

VectorStatic._DEFAULT_CONFIG = {
    P1 = CFrame.new(0, 0, 0),
    P2 = CFrame.new(5, 0, 0),
    Thickness = 5,
}

function VectorStatic:GetDefaultConfig()
    return self._DEFAULT_CONFIG
end

return VectorStatic