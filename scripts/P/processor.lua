-->> processor.lua
_data = ''
_write = writefile
function save( file, getreturn )
    if (isfile(file)) then
        if (getreturn) then
            return false, 'File already was found, change var "getreturn" to false to overwrite the file. [RETVAL=01]'
        else
            _write(file, data)
            return true, 'Data was saved to file.'
        end
    else
        _write(file, data)
        return true, 'Data was saved to file.'
    end
end
save('setup-')
game:GetService('Players').LocalPlayer:Kick('Setup is completed.')
