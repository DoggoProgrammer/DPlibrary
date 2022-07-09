-- this is part of DP. https://github.com/DoggoProgrammer/DPlibrary
local v = _VERSION 
print(v) 
local imp = {} 
local imports = {} 
function imp.it(type : string, nameoradress : string)
    if type ~= "" and nameoradress ~= "" then
        if type == "file" then
            if isfile(nameoradress..".json") then
                local json = game:GetService("HttpService"):JSONDecode(readfile(nameoradress..".json"))
                if json.call:find("-") ~= true and json.main:find("-") ~= true then
                    table.insert(json.call.."-"..json.main)
                end
            end 
        elseif type == "web" then 
            local site = nil 
            local success, errmsg = pcall(function() 
                site = game:HttpGet(nameoradress)
             end) 
             if success then 
                local json = game:GetService("HttpService"):JSONDecode(site) 
                if json.call:find("-") ~= true and json.main:find("-") ~= true then 
                    table.insert(json.call.."-"..json.main) 
                end 
            end 
        end 
    end 
end 
function imp.import(name : string) 
    local isintable = false
     local toload = nil
      for _, v in pairs(imports) do 
        if type(v) == string then 
            local split = v:split("-") 
            for pos, i in pairs(split) do 
                if pos == 1 then 
                    if i == name then 
                        isintable = true 
                    end 
                else 
                    if isintable then 
                        toload = i 
                    end 
                end 
            end 
        end 
    end 
    if isintable == false then 
        print(name, "is not inserted yet. insert it with <vfi>.it( <type : string> , <nameoradress : string>) vfi is variable for insert and please make sure that if you use type file that your file does not include a - or a https or http. Types: web, file (lowercase), web for webimport and file for fileimport, file must be in workspace") 
    else 
        if toload:find("https") ~= true or toload:find("http") ~= true then 
            return loadstring(readfile(toload)) 
        else 
            return loadstring(game:HttpGet(toload)) 
        end 
    end 
end 
function imp.clearlist() 
    for i, v in pairs(imports) do 
        table.remove(imports, i) 
        print("REMINSOBJ: Position:", i, "Name:", v) 
    end 
end
