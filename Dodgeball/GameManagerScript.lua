local matchStarted = false

--function to be called when a new game starts
function newGame()
	
	matchStarted = true
	
	wait(3)
	--Teleport Purple players to purple teleport block
	for i, player in ipairs(game.Teams["PurpleTeam"]:GetPlayers()) do
		player.Character:MoveTo(game.Workspace.PurpleTeleport.CFrame.p)
	end
	--Teleport Orange players to orange teleport block
	for i, player in ipairs(game.Teams["OrangeTeam"]:GetPlayers()) do
		player.Character:MoveTo(game.Workspace.OrangeTeleport.CFrame.p)
	end
	
  -- Remove all items in players inventory
	for _, Player in pairs(game.Players:GetPlayers()) do
		for _, Tool in pairs(Player.Backpack:GetChildren()) do
			if Tool:IsA("Tool") then
				Tool:Destroy()
			end
		end
		if Player.Character:FindFirstChildOfClass("Tool") then
			Player.Character:FindFirstChildOfClass("Tool"):Destroy()
		end --Deletes Equipped Tool
	end
	
	--Clear all the dodgeballs
	game.Workspace.Dodgeballs:ClearAllChildren()
	--Go through each dodgeball spawn and spawn a new dodgeball at that location
	for i, ballSpawn in ipairs(game.Workspace.DodgeballSpawns:GetChildren()) do
		local newBall = game.Workspace.Dodgeball:Clone()
		newBall.Parent = game.Workspace.Dodgeballs
		newBall.Handle.CFrame = ballSpawn.CFrame
	end
	
	--link our player count to the int values on our game manager
	script.Parent.PurplePlayers.Value = table.getn(game.Teams["PurpleTeam"]:GetPlayers())
	script.Parent.OrangePlayers.Value = table.getn(game.Teams["OrangeTeam"]:GetPlayers())
	
	for i, sparkler in ipairs(game.Workspace.Sparklers:GetChildren()) do
		sparkler.Sparkles.Enabled = false
	end
	
end

--loop that checks if there is enough players to start a new game
while true do
	--Conditional to run code when a match is started or not
	if matchStarted then
		--If the purple team is eliminated
		if script.Parent.PurplePlayers.Value <=0 then
			--Change the sparklers to orange team color
			for i, sparkler in ipairs(game.Workspace.Sparklers:GetChildren()) do
				sparkler.Sparkles.Enabled = true
				sparkler.Sparkles.SparkleColor = Color3.fromRGB(218,133,65)
			end
			
			matchStarted = false
			
			wait(3)
		--If the orange team is eliminated
		elseif script.Parent.OrangePlayers.Value <= 0 then
			--Change the sparklers to purple team color
			for i, sparkler in ipairs(game.Workspace.Sparklers:GetChildren()) do
				sparkler.Sparkles.Enabled = true
				sparkler.Sparkles.SparkleColor = Color3.fromRGB(123,47,123)
			end
			
			matchStarted = false
			
			wait(3)
			
		end
		
	else
		--get the nplayers on both teams
		local purplePlayers = table.getn(game.Teams["PurpleTeam"]:GetPlayers())
		local orangePlayers = table.getn(game.Teams["OrangeTeam"]:GetPlayers())
		--check if there is at least one player on each team to start a new game
		if purplePlayers > 0 and orangePlayers > 0 then
			newGame()
		end
		
	end
	
	wait(0.5)
	
end
