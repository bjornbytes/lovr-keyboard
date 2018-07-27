lovr-keyboard
===

A keyboard module for LÖVR.

Usage
---

Copy `lovr-keyboard.lua` to your project and require it.  I like to put it on the `lovr` global so
I can treat it like any other module:

```lua
lovr.keyboard = require 'lovr-keyboard'

function lovr.update(dt)
  print(lovr.keyboard.isDown('space'))
end
```

API
---

- `keyboard.isDown(key)` Returns whether or not the specified key is down.  Currently letters,
  numbers, and 'space' are supported.
- `lovr.keypressed(key)` Called when a key is pressed.
- `lovr.keyreleased(key)` Called when a key is released.

License
---

MIT
