local physics = game:GetService("PhysicsService")
--Create collision groups
physics:CreateCollisionGroup("Wall")
physics:CreateCollisionGroup("Dodgeballs")
--set wall collision group
physics:SetPartCollisionGroup(script.Parent, "Wall")
--make wall and dodgeballs not collide
physics:CollisionGroupSetCollidable("Wall", "Dodgeballs", false)
