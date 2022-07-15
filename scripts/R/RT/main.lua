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
-->> Other Functions
local function update(new) CODE = {new.raw, new.class, new.http_requests} end -->> update is being used when the player launches a script so the var CODE can be updated
