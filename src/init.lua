-- FusionRouter
-- afrxo, 22.06.22

local App = require(script:WaitForChild("App"))
local Router = require(script:WaitForChild("Router"))

local PubTypes = require(script:WaitForChild("PubTypes"))

export type App = PubTypes.App
export type Router = PubTypes.Router
export type Context<Props> = PubTypes.Context<Props>
export type ComponentFactory<Props> = PubTypes.ComponentFactory<Props>

type FusionRouter = {
    App: () -> App,
    Router: <Props>(Path: string, ComponentFactory<Props>) -> Router
}

return function (Fusion)
    return {
        App = App(Fusion),
        Router = Router
    } :: FusionRouter
end