-- This Script will give the Player a speed + jump boost
-- To be used concurrently with PowerDownScript to set the Players stats back to normal
-- Alternatively, you can combine the 2 Scripts together with a wait block in between to make it
-- a time buff

function powerUp(part)
	local humanoid = part.Parent:FindFirstChild("Humanoid")
	-- Check if Humanoid exist
	if humanoid then
		humanoid.UseJumpPower = true 
		humanoid.WalkSpeed = 16 * 4 -- Change walking speed
		humanoid.JumpPower = 50 * 2 -- Change jump powerz
	end
end

script.Parent.Touched:Connect(powerUp)
