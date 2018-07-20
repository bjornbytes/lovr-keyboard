lovr.keyboard = require 'lovr-keyboard'

function lovr.update(dt)
  if lovr.keyboard then
    print(lovr.keyboard.isDown('space'))
  end
end
