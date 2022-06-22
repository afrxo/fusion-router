-- Router
-- afrxo, 22.06.22

local Symbols = require(script.Parent:WaitForChild("Symbols"))

local function createRouter(path: string, componentFactory)
    local Router = setmetatable({}, getmetatable(Symbols.Router))
    Router.path = path
    Router.factory = componentFactory
    return Router
end

return createRouter