lovr-keyboard
===

A keyboard module for LÖVR.

Usage
---

Copy `lovr-keyboard.lua` to your project and require it.  I like to put it on the `lovr` global like this:

```lua
lovr.keyboard = require 'lovr-keyboard'

function lovr.update(dt)
  print(lovr.keyboard.isDown('space'))
end
```

API
---

- `keyboard.isDown(key, ...)` Returns whether any of the specified keys are held down.  The names of
  all the supported keys can be found [here](https://github.com/bjornbytes/lovr-keyboard/blob/master/lovr-keyboard.lua#L15).
- `lovr.keypressed(key)` Called when a key is pressed.
- `lovr.keyreleased(key)` Called when a key is released.

License
---

MIT
