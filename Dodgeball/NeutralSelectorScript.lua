function selectTeam(part)
	-- get character and player variables
	local character = part.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	
	--if player exists change team
	if player then
		--change the team
		player.Team = game:GetService("Teams"):FindFirstChild("NeutralTeam")
		--teleport the player, make sure you have a Model called NeutralSpawn with a SpawnLocation in it.
		character:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace.NeutralSpawn.SpawnLocation.CFrame + Vector3.new(0, 5, 0)
		
	end
	
end
script.Parent.Touched:Connect(selectTeam)
