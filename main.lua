lovr.keyboard = require 'lovr-keyboard'

function lovr.keypressed(key)
  print('keypressed', key)
end

function lovr.keyreleased(key)
  print('keyreleased', key)
end

function lovr.update(dt)
  if lovr.keyboard.isDown('a', 'e', 'i', 'o', 'u') then
    print('haha stop pressing vowels it tickles')
  end
end
