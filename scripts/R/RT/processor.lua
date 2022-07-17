-->> processor.lua / compiling file
local comp = {}
local available = true
local op = ''
function comp.returnifavailable()
    
    return available
    
end -->> end of function comp.returnifavailable
function startercheck(name, code)
    if name == 'template' then
        local codesplit = code:split(';')
        local checknew = nil
        for i, v in pairs(codesplit) do
            if i == checknew then
                return v
            else
                if v == 'tl' then
                    checknew = i+2
                end
            end
        end
    end
end
function split(position, code)
    code = code:split(';')
    for i, v in pairs(code) do
        if i == position then
            return v
        end
    end
end
function search(searchfor, code)
    if searchfor:sub(1, 2) == 'cf' then
        if searchfor:sub(3, 3) == ':' then
            searchfor = searchfor:sub(4, searchfor:len())
            if searchfor == 'vars' then
                local splitcode = code:split(';')
                local searchfornext = nil
                local variables = {}
                for i, v in pairs(splitcode) do
                    if i == searchfornext then
                        local value = split(i+2)
                        table.insert(variables, v .. ' ' .. value)
                    else
                        if v == 'var' then
                            searchfornext = i+1
                        end
                    end
                end
                return variables
            elseif searchfor == 'functions' then
                local splitcode = code:split(';')
                local searchfornext = nil
                local functions = {}
                for i, v in pairs(splitcode) do
                    if i == searchfornext then
                        table.insert(functions, v)
                    else
                        if v == 'func' then
                            searchfornext = i+1
                        end
                    end
                end
                return functions
            end
        end
    end
end
function comp.compile(code)
    local tl = startcheck('template')
    if tl == 'nil' then
        op = 'user selected no template'
        local STARTUP = {VARIABLES = nil, FUNCTIONS = nil}
        STARTUP.VARIABLES = comp.search('cf:vars')
        STARTUP.FUNCTIONS = comp.search('cf:functions')
    end
end -->> end of function comp.compile

return comp
