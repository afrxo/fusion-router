# Fusion-Router


```lua
local Fusion = require(game.ReplicatedStorage.Fusion)
local Component = require(game.ReplicatedStorage.FusionComponent)

local PageOneComponent = Component()

function PageOneComponent:render()
	return {
		Fusion.New "TextLabel" {
			Text = "You are on page one",
			AnchorPoint = Vector2.one / 2,
			Size = UDim2.fromOffset(200,50),
			Position = UDim2.fromScale(.5,.5)
		},

		Fusion.New "TextButton" {
			Text = "->",
			AnchorPoint = Vector2.one / 2,
			Size = UDim2.fromOffset(50,35),
			Position = UDim2.fromScale(.5675,.63),
			[Fusion.OnEvent("Activated")] = function()
				self.props.context.app:redirect("/2")
			end,
		},
	}
end

return PageOneComponent.new
```

```lua
local Fusion = require(game.ReplicatedStorage.Fusion)
local Component = require(game.ReplicatedStorage.FusionComponent)

local PageTwoComponent = Component()

function PageTwoComponent:render()
	return {
		Fusion.New "TextLabel" {
			Text = "You are on page two",
			AnchorPoint = Vector2.one / 2,
			Size = UDim2.fromOffset(200,50),
			Position = UDim2.fromScale(.5,.5)
		},

		Fusion.New "TextButton" {
			Text = "<-",
			AnchorPoint = Vector2.one / 2,
			Size = UDim2.fromOffset(50,35),
			Position = UDim2.fromScale(.4325,.63),
			[Fusion.OnEvent("Activated")] = function()
				self.props.context.app:redirect("/1")
			end,
		},
	}
end

return PageTwoComponent.new
```

```lua
local Fusion = require(game.ReplicatedStorage.Fusion)
local FusionRouter = require(game.ReplicatedStorage.FusionRouter)(Fusion)

local PageOne = require(script.PageOne)
local PageTwo = require(script.PageTwo)

local App = FusionRouter.App()

App:use(FusionRouter.Router("/1", function(context)
	return PageOne({ context = context })
end))

App:use(FusionRouter.Router("/2", function(context)
	return PageTwo({ context = context })
end))

App:redirect("/1")

App:mount(Node)
```
