local checkpoint = script.Parent

function stepOnCheckpoint(part)
	-- Check if it's player that stepped on the checkpoint
	if part.Parent and part.Parent:FindFirstChild('Humanoid') then
		-- Get the player that stepped on the checkpoint
		-- It kinda becomes a 'table' that saves every players last checkpoint
		local player = game.Players:GetPlayerFromCharacter(part.Parent)
		
		-- Get the saved checkpoint data
		local checkpointData = game.ServerStorage:FindFirstChild('CheckpointData')
		
		-- Create the chekcpoint data if it doesn't exist
		if not checkpointData then
			checkpointData = Instance.new('Model', game.ServerStorage)
			checkpointData.Name = 'CheckpointData'
		end
		
		-- Get the player's saved checkpoint
		local savedCheckpoint = checkpointData:FindFirstChild(player.Name)
		-- Check if the player has no saved checkpoint
		if not savedCheckpoint then
			-- Create the players saved checkpoint data
			savedCheckpoint = Instance.new('ObjectValue', checkpointData)
			savedCheckpoint.Name = player.Name
			
			-- Tell the player to respawn at that checkpoint
			local function goToCheckpoint(character)
				wait()
				-- Get the respawn location
				local location = savedCheckpoint.Value.CFrame
				-- Move the character to that location; Wait for player to fully load
				character:WaitForChild('HumanoidRootPart').CFrame = location + Vector3.new(0, 4, 0) 
				-- Makes sure our player spawns above the platform
			end
			player.CharacterAdded:Connect(goToCheckpoint)
		end
		-- Set checkpoint
		if savedCheckpoint.Value ~= checkpoint then
			savedCheckpoint.Value = checkpoint
			print('Checkpoint 1 saved.')
		end
	end
end

checkpoint.Touched:Connect(stepOnCheckpoint)
