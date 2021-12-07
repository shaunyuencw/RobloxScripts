function setPlayerCheckpoint(player)
	local checkpoint = Instance.new('CFrameValue', player)
	checkpoint.Name = 'checkpoint'
	checkpoint.Value = game.Workspace.SpawnLocation.CFrame
	
	local function goToCheckpoint(character)
		wait()
		character:WaitForChild('HumanoidRootPart').CFrame = player.checkpoint.Value + Vector3.new(0,4,0)
	end
	player.CharacterAdded:Connect(goToCheckpoint)
end

game.Players.PlayerAdded:Connect(setPlayerCheckpoint)
