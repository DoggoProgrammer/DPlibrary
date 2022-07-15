-->> rt api
-->> General
local function req(name)
	if (name == 'APP') then
		return game:HttpGet('')
	end
end
-->> Settings
local APPLICATION = req('APP') -->> code gui
local CODE = {raw = '', class = '', http_requests = false} -->> class is the script listed in a list (script1, script2)
-->> Gui
local function resize(size : UDim2, obj : Instance, cooldown : number)
	obj:TweenSize(size, 'Out', 'Linear', 1)
end
local function buttoncolour(obj : table)
	local isinstance = true
	for _, v in pairs(obj) do
		if v.ClassName ~= 'TextButton' then
			isinstance = false
		end
	end
	if isinstance then
		for _, v in pairs(obj) do
			v.MouseEnter:Connect(function()
				for x = 45, 35, 3 do
					v.BackgroundColor3 = Color3.fromRGB(x, x, x)
					v.BorderColor3 = Color3.fromRGB(x, x, x)
					task.wait()
				end
			end)
			v.MouseButton1Click:Connect(function()
				for x = 0, 1, 0.2 do
					v.Parent.BackgroundTransparency = x
					task.wait()
				end
				resize(UDim2.new(0, 676, 0, 349), 0.5)
			end)
		end
	end
end
-->> Other Functions
local function update(new) CODE = {new.raw, new.class, new.http_requests} end -->> update is being used when the player launches a script so the var CODE can be updated
