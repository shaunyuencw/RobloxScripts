local dodgeball = script.Parent
local dangerous = dodgeball.Dangerous
local team = script.Parent.Team
--variables for storing handle
local handle = dodgeball.Handle
local tempHandle = dodgeball.TempHandle

--function that runs when we left click
function onClick()
	--Store the player and then change the dodgeball parent
	local character = dodgeball.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	dodgeball.Parent = game.Workspace.Dodgeballs
	
	local look = character.Head.CFrame.lookVector
	
	dodgeball.Handle.Velocity = look * 100 -- Change this to make ball faster/slower
	
	--set to dangerous and store team value
	dangerous.Value = true
	team.Value = player.Team
	
	--enabling trail and setting color
	handle.Trail.Enabled = true
	handle.Trail.Color = ColorSequence.new(player.Team.TeamColor.Color)
	
	handle.Parent = tempHandle
	
	wait(3)
	
	--changing dangerous, team color, and handle
	dangerous.Value = false
	team.Value = nil
	tempHandle.Handle.Parent = dodgeball
	
	handle.Trail.Enabled = false
	
	
end
dodgeball.Activated:Connect(onClick)

function collide(part)
	
	local character = part.Parent
	--If dangerous then check for ability to do damage
	if dangerous.Value == true then
		--if player then check for team status
		if character:FindFirstChild("Humanoid") then
			--get player then check for team being opposite
			local player = game.Players:GetPlayerFromCharacter(character)
			if player.Team ~= team.Value then
				character.Humanoid.Health = character.Humanoid.Health - 100
			end
		end
	end
	
end
dodgeball.Handle.Touched:Connect(collide)
--set dodgeball collision group
wait(1)
local physics = game:GetService("PhysicsService")
physics:SetPartCollisionGroup(script.Parent.Handle, "Dodgeballs")
