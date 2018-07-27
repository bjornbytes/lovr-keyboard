lovr.keyboard = require 'lovr-keyboard'

function lovr.keypressed(key)
  print('keypressed', key)
end

function lovr.keyreleased(key)
  print('keyreleased', key)
end

function lovr.update(dt)
  if lovr.keyboard.isDown('space') then
    print('I just need some space')
  end
end
