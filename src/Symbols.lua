-- Symbols
-- afrxo, 22.06.22

local function createSymbol(name: string)
    local Symbol = newproxy(true)
    getmetatable(Symbol).__index = { name = name, type = "Symbol" }
    return Symbol
end

return {
    App = createSymbol("App"),
    Router = createSymbol("Router"),
    Context = createSymbol("Context")
}