-- This Script will give the Player a speed + jump boost
-- To be used concurrently with PowerDownScript to set the Players stats back to normal
-- Alternatively, you can combine the 2 Scripts together with a wait block in between to make it
-- a time based buff/debuff

function powerDown(part)
	local humanoid = part.Parent:FindFirstChild("Humanoid")
	-- Check if Humanoid exist
	if humanoid then
    -- WalkSpeed = 16 & JumpPower = 50 are the default values, you can reduce it below that amount to "debuff the player
		humanoid.WalkSpeed = 16 
		humanoid.JumpPower = 50
	end
end

script.Parent.Touched:Connect(powerDown)
