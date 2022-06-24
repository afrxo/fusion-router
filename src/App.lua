-- App
-- afrxo, 22.06.22

local FusionContext

local Symbols = require(script.Parent:WaitForChild("Symbols"))
local reconcile = require(script.Parent:WaitForChild("Reconcile"))
local createContext = require(script.Parent:WaitForChild("Context"))

local function updateRenderedState(App, Route, Props)
    local context = createContext(App, Route.path, Props)
    local renderedState = Route.factory(context, Props)
    App.state:set(reconcile(renderedState))
    App.ctx = context
end

local function createApp()
    local App = setmetatable({}, getmetatable(Symbols.App))
    App.state = FusionContext.Value(nil)
    App.routes = {}
    App.ctx = createContext(App, "/", {})

    function App:use(router)
        if (getmetatable(router) == getmetatable(Symbols.Router)) then
            App.routes[#App.routes+1] = router
        end
    end

    function App:redirect(path: string, props)
        props = props or {}
        for i = 1, #App.routes do
            local Route = App.routes[i]
            if (Route.path:match(path)) then
                updateRenderedState(App, Route, props)
            end
        end
    end

    function App:mount(parent: Instance)
        if (self.node) then
            self.node:Destroy()
        end
        self.node = FusionContext.New("Frame")({
            Parent = parent,
            Size = UDim2.fromScale(1,1),
            BackgroundTransparency = 1,
            [FusionContext.Children] = self.state
        })
    end

    function App:getContext()
        return self.ctx
    end

    function App:unmount()
        if (not self.node) then
            error("App is not mounted")
        end
        self.node:Destroy()
    end

    return App
end

return function (Fusion)
    FusionContext = Fusion
    return createApp
end