--function to run when a player is added
function newPlayer(player)
	--function called when a player dies
	local function knockedOut()
		--check what team the player is on and subtract 1 from their team value
		if player.Team == game.Teams["PurpleTeam"] then
			game.Workspace.GameManager.PurplePlayers.Value = game.Workspace.GameManager.PurplePlayers.Value - 1
		elseif player.Team == game.Teams["OrangeTeam"] then
			game.Workspace.GameManager.OrangePlayers.Value = game.Workspace.GameManager.OrangePlayers.Value - 1
		end
		
	end
	player.CharacterRemoving:Connect(knockedOut)
	
end
game.Players.PlayerAdded:Connect(newPlayer)

