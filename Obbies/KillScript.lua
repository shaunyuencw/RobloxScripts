-- This script will kill the Player if it comes into contact with this block

function destroyCharacter(object)
	if object.Parent and object.Parent:FindFirstChild('Humanoid') then
		object.Parent.Humanoid.Health = 0 -- Set the Players health to 0
    -- You can also change it to -= X to reduce players health by X instead of killing them instantly
	end
end

script.Parent.Touched:Connect(destroyCharacter)
