local model = script.Parent.Parent -- Detonator
local duration = script.Parent.Name -- 5
local handle = script.Parent.Head
local activated = false -- So that script does not spam explosions

-- Clone TNT and wall so we can replace them later
local resetWall = model.Obstacle:Clone()
local resetTNT = model.TNT:Clone()

function spawnExplosion()
	if activated == true then
		return
			
	end
	-- Setting up obstacle and TNT
	local obstacle = model.Obstacle
	local tnt = model.TNT.TNT
	
	handle.BrickColor = BrickColor.Green()
	activated = true -- Exploded
	
	-- Countdown for detonator
	for i = duration, 0, -1 do
		script.Parent.Name = i
		wait(1)
	end
	
	local explosion = Instance.new("Explosion", model)
	local sound = game.Workspace.Explosion
	sound:Play()
	explosion.BlastPressure = 100000000
	explosion.BlastRadius = 5 -- Try not to make too big
	explosion.Position = tnt.Position
	model.TNT:Destroy()
	
	-- Wait before resetting the Detonator
	wait(10)
	
	handle.BrickColor = BrickColor.Red() -- .new(R,G,B) for custom colors
	handle.Name = duration -- Reset countdown
	activated = false -- Reset
	
	-- Destroy the old wall
	local OldObstacle = model:FindFirstChild("Obstacle")
	if OldObstacle then
		OldObstacle:Destroy()
	end
	
	-- Reset the obstacles
	obstacle = resetWall:Clone()
	tnt = resetTNT:Clone()
	
	obstacle.Parent = model
	tnt.Parent = model
	
	obstacle:MakeJoints()
end

handle.ClickDetector.MouseClick:Connect(spawnExplosion)
