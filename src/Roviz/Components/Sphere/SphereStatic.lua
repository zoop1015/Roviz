local SphereStatic = {}

SphereStatic._DEFAULT_CONFIG = {
    Position = CFrame.new(0, 0, 0),
    Radius = 5,
    Rings = 6,
    Segments = 6,
    Thickness = 1,
}

function SphereStatic:GetDefaultConfig()
    return self._DEFAULT_CONFIG
end

return SphereStatic