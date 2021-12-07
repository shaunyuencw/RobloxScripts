local block = script.Parent 

function setCheckpoint(character)
	local newCheckpoint = block.CFrame
	local player = game.Players:GetPlayerFromCharacter(character.Parent)
	player.checkpoint.Value = newCheckpoint
end

block.Touched:Connect(setCheckpoint)
