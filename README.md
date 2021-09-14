lovr-keyboard
===

A keyboard module for LÖVR.

Note: As of LÖVR v0.14.0, there are builtin keyboard events: `lovr.keypressed`, `lovr.keyreleased`,
and `lovr.textinput`.  This library still provides the `isDown`, `wasPressed`, and `wasReleased`
functions which can be helpful, but lovr-keyboard is no longer *required* to get keyboard support.

Usage
---

Copy `lovr-keyboard.lua` to your project and require it.  I like to put it on the `lovr` global like this:

```lua
lovr.keyboard = require 'lovr-keyboard'

function lovr.update(dt)
  print(lovr.keyboard.isDown('space'))
end
```

lovr-keyboard can only run on systems where LÖVR uses both LuaJIT and GLFW. If your project needs to be compatible with Android or WebVR, you can optionally include lovr-keyboard with:

```lua
if type(jit) == 'table' and lovr.getOS() ~= 'Android' and lovr.getOS() ~= 'Web' then
	lovr.keyboard = require 'lovr-keyboard'
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
