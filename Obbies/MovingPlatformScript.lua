-- This script will make a moving "anchor" platform that moves back and forth from a Start Block to a Finish Block
-- It will then move an additional block to follow the anchor that the player can interact with
-- Can be used as an Elevator if Start and Finish block is changed to fit.

local model = script.Parent

local platform = model.Anchor
local start = model.Start
local finish = model.Finish

local distance = finish.Position - start.Position
local travelTime = 120 -- In game time is about 60 heartbeats/s

local incrementX = distance.X/travelTime
local incrementY = distance.Y/travelTime
local incrementZ = distance.Z/travelTime
local progress = 0

local forward = true -- Either go forward when true, backwards when false

-- Make "Start" and "Finish" platforms invisible
start.Transparency = 1
finish.Transparency = 1
platform.Transparency = 1

-- Function to move our platforms from starting position to ending and back
function move()
	progress = progress + 1 -- progress += 1
	
	-- Move forward or backwards depending on "forward" boolean
	if forward then
		platform.Position = platform.Position + Vector3.new(incrementX, incrementY, incrementZ)
	else
		platform.Position = platform.Position - Vector3.new(incrementX, incrementY, incrementZ)
	end
	
	
	if progress >= travelTime then
		progress = 0
		if forward == true then
			-- Platform has just moved from "Start" to "Finish" Position
			forward = false -- Change the direction
			if platform.Position ~= finish.Position then
				platform.Position = finish.Position
			end
			
		else
			-- Platform has just moved from "Finish" to "Start" Position
			forward = true -- Change the direction
			if platform.Position ~= start.Position then
				platform.Position = start.Position
			end
		end
	end
		
end

game:GetService("RunService").Heartbeat:Connect(move)
