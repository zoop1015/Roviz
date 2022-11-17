--[[
    Roviz,
    Robert Zak,
    17 november, 2022.
]]

local Trove = require(game.ReplicatedStorage.Packages.Trove)

local Roviz: {[any] : any} = {}
Roviz.__index = Roviz

local cf = CFrame

--[[
    Constructs a Roviz object.

    @return Roviz

    @param geometryType - The type of geometry to render.

    The following geometry are available for rendering:

    | Geometry | Visual Definition |
    | -------- | ----------------- |
    | `Vector` | A ray with a direction |
    | `Sphere` | A perfectly rounded ball |
]]
function Roviz.new(geometryType: string): {[any]: any}
    local self = setmetatable({}, Roviz)

    self._geometryType = geometryType
    self._trove = Trove.new()

    return self
end

--[[
    Destroys the Roviz object & unrenderes attached geometry to this object.
]]
function Roviz:Destroy()
    self._trove:Destroy()
end

--[[
    Alias for ```lua Roviz:Destroy()```.
]]
function Roviz:Unrender()
    self._trove:Destroy()
end

return Roviz