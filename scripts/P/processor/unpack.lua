local setup = {}
local console = {log = rconsoleprint, clear = rconsoleclear, name = rconsolename, input = rconsoleinput}
__data = nil
__info = nil
function setup.data( data )
    __data = data
end
function setup.info( info )
    __info = info
end
console.name('PU')
console.log('Waiting For Input...\n')
repeat task.wait() until __data ~= nil
console.log('Input Found information is being collected...\n')
repeat task.wait() until __info ~= nil
console.log('INPUT: ' .. __info.name .. ' ' .. __info.file .. '\nThe File is being unpacked...')
return setup
