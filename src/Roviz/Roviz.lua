--[[
    Roviz,
    Robert Zak,
    17 november, 2022.
]]

local Trove = require(script.Parent.Parent.Packages.Trove)

local Roviz: {[any] : any} = {}
Roviz.__index = Roviz

--[[
    Constructs a Roviz object.

    @return Roviz

    @param geometryType - The type of geometry to render.

    The following geometry are available for rendering:

    | Geometry | Visual Definition |
    | -------- | ----------------- |
    | `Vector` | A ray with a direction |
    | `Sphere` | A perfectly rounded ball |

    @param config - Configurations for the geometry to be rendered.

    :::note
        Each geometry type has different configurations, some have a correlation,
        and some don't. E.g. `Sphere' uniquely has { Radius; Segments; Rings; }.
    :::
]]
function Roviz.new(geometryType: string, config: {[string] : any}): {[any]: any}

    if type(geometryType) ~= "string" then
        warn("ER-01: " , geometryType, " is type '" ,
         type(geometryType) , "', expected string.")
    end

    if not script.Parent.Components:FindFirstChild(geometryType) then
        warn("ER-02: Unable to index ", geometryType,
         ", indexing geometry types is case-sensitive.")
    end

    -- Excluding all inapplicable configurations & informing them.
    do
        local excludedConfigs = {}
        local appropriateConfigs =
         require(script.Parent.Components[geometryType].SphereStatic):GetDefaultConfig()

        for configKey, _ in pairs(config) do
            if appropriateConfigs[configKey] == nil then
                table.insert(excludedConfigs, configKey)
            end
        end

        --{{ Implement a wrapper function within the `table` class. }}
        -- if "excludedConfigs LENGTH" ~= 0 then
        --     warn("The following configs were excluded : ( " , table.unpack(excludedConfigs) ,
        --      " ) Their correlating values have been swapped with the default ones")
        -- end
    end

    local self = setmetatable({}, Roviz)

    self._trove = Trove.new()

    self._geometryInstance = require(script.Parent.Components[geometryType]
    [geometryType .. "Instance"]).new(config, self._trove)

    return self
end

--[[
    Renders/Draws the geometry attached to the Roviz in the workspace.
]]
function Roviz:Render()
    self._geometryInstance:Render()
end

--[[
    Alias for ```lua Roviz:Render()```.
]]
function Roviz:Draw()
    self._geometryInstance:Render()
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