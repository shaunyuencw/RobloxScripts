-- This Script will make a block fall off the map when it is touched, and respawn back after 10s

-- Save the Parent into a variable so we can easily use it.
local part = script.Parent
local fallen = false -- Block has not fallen at the start

function gravity(touched)
  -- Check if the part that touched the block is indeed a Humanoid
  -- Also check if the block has already fallen
	if touched.Parent:FindFirstChild("Humanoid") and fallen == false then
    -- Set fallen to true
		fallen = true
    -- Create and store a clone for safekeeping later
		local copy = part:Clone()
    -- Make the block fall
		copy:FindFirstChild("BlockRespawnerScript"):Remove()
		part.Transparency = 1
		part.CanCollide = false
		copy.Parent = part.Parent
		copy.Anchored = false
		wait(10)
		copy:Destroy()
    
    -- Bring the clone back and set fallen back to false
		part.Transparency = 0
		part.CanCollide = true
		fallen = false
	end
end

-- When the part is "touched" run the gravity function
part.Touched:Connect(gravity)
