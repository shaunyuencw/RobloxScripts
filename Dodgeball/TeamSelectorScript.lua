function selectTeam(part)
	-- get character and player variables
	local character = part.Parent
	local player = game.Players:GetPlayerFromCharacter(character)
	
	--if player exists change team
	if player then
		--change the team to whichever Team Name you have
		player.Team = game:GetService("Teams"):FindFirstChild("NeutralTeam")
		--teleport the player, make sure you have a Model with a SpawnLocation in it.
		character:FindFirstChild("HumanoidRootPart").CFrame = game.Workspace.NeutralSpawn.SpawnLocation.CFrame + Vector3.new(0, 5, 0)
		
		-- Repeat for however many teams you have!
	end
	
end
script.Parent.Touched:Connect(selectTeam)
