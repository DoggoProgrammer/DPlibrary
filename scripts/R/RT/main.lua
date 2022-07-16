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
local function reposition(position, obj, cooldown)
	obj:TweenPosition(position, 'Out', 'Linear', cooldown)
end
local function resize(size, obj, cooldown)
	obj:TweenSize(size, 'Out', 'Linear', cooldown)
end
local function buttoncolour(objects)
	local isinstance = true
	for _, v in pairs(objects) do
		if v.ClassName ~= 'TextButton' then
			isinstance = false
		end
	end
	if isinstance then
		for _, v in pairs(objects) do
			v.MouseEnter:Connect(function()
				for x = 45, 35, -3 do
					v.BackgroundColor3 = Color3.fromRGB(x, x, x)
					v.BorderColor3 = Color3.fromRGB(x, x, x)
					task.wait(0.1)
				end
			end)
			v.MouseLeave:Connect(function()
				for x = 35, 45, 3 do
					v.BackgroundColor3 = Color3.fromRGB(x, x, x)
					v.BorderColor3 = Color3.fromRGB(x, x, x)
					task.wait(0.1)
				end
			end)
			v.MouseButton1Click:Connect(function()
				for x = 0, 1, 0.2 do
					v.Parent.BackgroundTransparency = x
					for _, obj in pairs(objects) do
						obj.BackgroundTransparency = x
					end
					task.wait(0.1)
				end
				v.Parent.Visible = false
				reposition(UDim2.new(0.017, 0, 0.075, 0), v.Parent.Parent.Codebar, 0.5)
				task.wait(0.5)
				v.Parent.Parent.Commandbar.Visible = true
			end)
		end
	end
end
local Buttons = {}
for _, v in pairs(APPLICATION.Main:GetDescendants()) do if v:IsA('TextButton') then table.insert(Buttons, v) end end
buttoncolour(Buttons)
APPLICATION.Main.Commandbar.Minimize.MouseButton1Click:Connect(function()
	v.Parent.Visible = false
	v.Parent.Parent.Commandbar.Visible = false
	task.wait(0.5)
	reposition(UDim2.new(0.017, 0, 0.14, 0), APPLICATION.Main.Codebar, 0.5)
	task.wait(0.5)
	for x = 1, 0, -0.2 do
		APPLICATION.Main.Scripts.Visible = true
		APPLICATION.Main.Scripts.BackgroundTransparency = x
		for _, obj in pairs(Buttons) do
			if obj.Name:find('Script') then
				obj.BackgroundTransparency = x
			end
		end
		task.wait(0.1)
	end
end)
local Buttons = {}
for _, v in pairs(APPLICATION.Main.Scripts:GetChildren()) do if v:IsA('TextButton') then table.insert(Buttons, v) end end
buttoncolour(Buttons)
-->> Other Functions
local function update(new) CODE = {new.raw, new.class, new.http_requests} end -->> update is being used when the player launches a script so the var CODE can be updated
