-->> processor.lua
local setup = {}
__data = ''
__write = writefile
function setup.data(data)
    __data = data
end
repeat task.wait() until __data ~= ''
function save( file, ext, message )
    if (isfile(file)) then
        for x = 2, math.huge() do
            if not isfile(string.format(file..'%s%s', x, ext)) then
                __write(string.format(file..'%s%s', x, ext), __data .. '\n' .. message)
            end
        end
    else
        __write(file, __data .. '\n' .. message)
        return true, 'Data was saved to file.'
    end
end
save('setup-processor', '.lua', '-->> https://raw.githubusercontent.com/processor/unpack.lua')
game:GetService('Players').LocalPlayer:Kick('Setup is completed.')
return setup
