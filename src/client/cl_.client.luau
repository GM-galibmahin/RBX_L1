-- Main Impoets to get the Game Datas
local UserInputService = game:GetService("UserInputService") -- listens to player Keybord, Mouse, Controller Input
local Workspace = game:GetService("Workspace") -- Referencing the Work Space

local block = Workspace:WaitForChild("Block") -- Getting the Block Child

local value = block.Transparency -- Stores the default/current Transperency vlaue
local step = 0.1 -- Ammount to increase or Decrease

local oldPosition = block.Position -- Stores the default/current Position vlaue
local oldColor = block.Color
local moved = false 

UserInputService.InputBegan:Connect(function(input, gameProcessed) -- Records the players current Keypress [input: is the Key, gameProcessed: Is a Chat or UI is open ]
	if gameProcessed then
		return -- Stps the script if the Chait is open
	end

	if input.KeyCode == Enum.KeyCode.E then -- on input E pess reduces the value
		value -= step
	elseif input.KeyCode == Enum.KeyCode.Q then -- on input Q pess increases the value
		value += step
	end

	if input.KeyCode == Enum.KeyCode.R then
		block.Anchored = not block.Anchored -- This is a Boolean where it turn off and on the block Anchored, 
	end

	if input.KeyCode == Enum.KeyCode.F then
		
		if moved then -- If the block has been moved then it will reset the position and color
			block.Position = oldPosition
			block.Color = oldColor
			moved = false
		else -- If the block has not been moved then it will move the block to a new position and color
			block.Position = Vector3.new(10, 10, 10)
			block.Color = Color3.fromRGB(102, 255, 0)
			moved = true
		end
	end

	value = math.clamp(value, 0, 1) -- Claming/Stoping the value at 0 to 1 at max

	block.Transparency = value -- Updateing the main Transparency based on the value we get
	block.CanCollide = value < 1 
end)
