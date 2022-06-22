-- Context
-- afrxo, 22.06.22

local Symbols = require(script.Parent:WaitForChild("Symbols"))

local function createContext(app, path: string, props: {[string]: any})
    local Symbol = setmetatable({}, getmetatable(Symbols.Context))
    Symbol.app = app
    Symbol.path = path
    Symbol.props = props
    return Symbol
end

return createContext