-- this is part of DP. https://github.com/DoggoProgrammer/DPlibrary
-- please use this:
-- local Client = loadstring(game:HttpGet(https://raw.githubusercontent.com/DoggoProgrammer/DPlibrary/scripts/D/DPClient/DPClient.lua))()
-- Client.SM("sxc") sm stands for select mode sxc stands for console mode gui stands for gui mode
-- Client.RT(url) rt stands for redirectto (view the content of a site must be json view DPClient.md for more information) if you don't want to redirect to a site replace url with: "NONE" please also mind the quotes since it is a string
local client = {}
local sm = nil
local rt = nil
function client.SM(mode)
    if mode == "sxc" then
        sm = mode
        print("SM is now set to", mode)
    elseif mode == "gui" then
        sm = mode
        print("SM is now set to", mode)
    else
        print("undefined mode")
    end
end
function client.RT(url : string)
    local http = game:GetService("HttpService")
    local status, err = pcall(http.GetAsync, http, url)
    if status then
        rt = url
    elseif url == "NONE" then
        rt = "NONE"
    else
        print(err, "cannot add to rt")
    end
end
function client.startup()
    if sm ~= nil and rt ~= nil then
    else
        print("please check that you setup everything. (view the site https://raw.githubusercontent.com/DoggoProgrammer/DPLibrary/main/scripts/C/DPClient.lua for more information)")
    end
end
