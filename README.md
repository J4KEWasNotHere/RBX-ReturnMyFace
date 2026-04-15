
Head to [Releases](https://github.com/J4KEWasNotHere/RBX-ReturnMyFace/releases) to get the Module - the latest one would be at the top.

---

# 🏗️ Quick Start

Create a Script inside ServerScriptService, with the Module inside of it.

```lua
local PlayerService = game:GetService("Players")
local RunService = game:GetService("RunService")

local ReturnMyFace = require(script.ReturnMyFace)

-- Variables
local connections = {}

-- Utility

local function onPlayerAdded(player: Player)
	connections[player] = player.CharacterAdded:Connect(function(character)
		local humanoid: Humanoid = character:WaitForChild("Humanoid")
		
		task.defer(function()
			repeat
				RunService.Heartbeat:Wait()
			until character:IsDescendantOf(workspace)
			
			if not player:HasAppearanceLoaded() then
				player.CharacterAppearanceLoaded:Wait()
			end
			
			wait()
			ReturnMyFace.returnClassicFace(character)
		end)
	end)
end

-- Connections

PlayerService.PlayerAdded:Connect(onPlayerAdded)

PlayerService.PlayerRemoving:Connect(function(player: Player)
	if connections[player] then
		connections[player]:Disconnect()
		connections[player] = nil
	end
end)

for _, player in PlayerService:GetPlayers() do -- just in case the player joins before the script runs.
	if not connections[player] then onPlayerAdded(player) end
end
```
