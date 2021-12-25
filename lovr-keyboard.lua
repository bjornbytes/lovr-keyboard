local ffi = assert(type(jit) == 'table' and               -- Only run if we have LuaJIT
  lovr.system.getOS() ~= 'Android' and lovr.system.getOS() ~= 'Web' and -- and also GLFW
  require 'ffi', "lovr-keyboard cannot run on this platform")
local C = ffi.os == 'Windows' and ffi.load('glfw3') or ffi.C

ffi.cdef [[
  typedef struct GLFWwindow GLFWwindow;
  typedef void(*GLFWkeyfun)(GLFWwindow*, int, int, int, int);
  typedef void(*GLFWcharfun)(GLFWwindow*, unsigned int);

  GLFWwindow* glfwGetCurrentContext(void);
  int glfwGetKey(GLFWwindow* window, int key);
  GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun callback);
  GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun callback);
]]

local window = C.glfwGetCurrentContext()

local keymap = {
  ['space'] = { 32, 0, 0 },
  ['\''] = { 39, 0, 0 },
  [','] = { 44, 0, 0 },
  ['-'] = { 45, 0, 0 },
  ['.'] = { 46, 0, 0 },
  ['/'] = { 47, 0, 0 },

  ['0'] = { 48, 0, 0 },
  ['1'] = { 49, 0, 0 },
  ['2'] = { 50, 0, 0 },
  ['3'] = { 51, 0, 0 },
  ['4'] = { 52, 0, 0 },
  ['5'] = { 53, 0, 0 },
  ['6'] = { 54, 0, 0 },
  ['7'] = { 55, 0, 0 },
  ['8'] = { 56, 0, 0 },
  ['9'] = { 57, 0, 0 },

  [';'] = { 59, 0, 0 },
  ['='] = { 61, 0, 0 },

  ['a'] = { 65, 0, 0 },
  ['b'] = { 66, 0, 0 },
  ['c'] = { 67, 0, 0 },
  ['d'] = { 68, 0, 0 },
  ['e'] = { 69, 0, 0 },
  ['f'] = { 70, 0, 0 },
  ['g'] = { 71, 0, 0 },
  ['h'] = { 72, 0, 0 },
  ['i'] = { 73, 0, 0 },
  ['j'] = { 74, 0, 0 },
  ['k'] = { 75, 0, 0 },
  ['l'] = { 76, 0, 0 },
  ['m'] = { 77, 0, 0 },
  ['n'] = { 78, 0, 0 },
  ['o'] = { 79, 0, 0 },
  ['p'] = { 80, 0, 0 },
  ['q'] = { 81, 0, 0 },
  ['r'] = { 82, 0, 0 },
  ['s'] = { 83, 0, 0 },
  ['t'] = { 84, 0, 0 },
  ['u'] = { 85, 0, 0 },
  ['v'] = { 86, 0, 0 },
  ['w'] = { 87, 0, 0 },
  ['x'] = { 88, 0, 0 },
  ['y'] = { 89, 0, 0 },
  ['z'] = { 90, 0, 0 },

  ['['] = { 91, 0, 0 },
  ['\\'] = { 92, 0, 0 },
  [']'] = { 93, 0, 0 },
  ['`'] = { 96, 0, 0 },

  ['escape'] = { 256, 0, 0 },
  ['return'] = { 257, 0, 0 },
  ['enter'] = { 257, 0, 0 },
  ['tab'] = { 258, 0, 0 },
  ['backspace'] = { 259, 0, 0 },
  ['insert'] = { 260, 0, 0 },
  ['delete'] = { 261, 0, 0 },
  ['right'] = { 262, 0, 0 },
  ['left'] = { 263, 0, 0 },
  ['down'] = { 264, 0, 0 },
  ['up'] = { 265, 0, 0 },
  ['pageup'] = { 266, 0, 0 },
  ['pagedown'] = { 267, 0, 0 },
  ['home'] = { 268, 0, 0 },
  ['end'] = { 269, 0, 0 },
  ['capslock'] = { 280, 0, 0 },
  ['scrolllock'] = { 281, 0, 0 },
  ['numlock'] = { 282, 0, 0 },
  ['printscreen'] = { 283, 0, 0 },
  ['pause'] = { 284, 0, 0 },

  ['f1'] = { 290, 0, 0 },
  ['f2'] = { 291, 0, 0 },
  ['f3'] = { 292, 0, 0 },
  ['f4'] = { 293, 0, 0 },
  ['f5'] = { 294, 0, 0 },
  ['f6'] = { 295, 0, 0 },
  ['f7'] = { 296, 0, 0 },
  ['f8'] = { 297, 0, 0 },
  ['f9'] = { 298, 0, 0 },
  ['f10'] = { 299, 0, 0 },
  ['f11'] = { 300, 0, 0 },
  ['f12'] = { 301, 0, 0 },

  ['kp0'] = { 320, 0, 0 },
  ['kp1'] = { 321, 0, 0 },
  ['kp2'] = { 322, 0, 0 },
  ['kp3'] = { 323, 0, 0 },
  ['kp4'] = { 324, 0, 0 },
  ['kp5'] = { 325, 0, 0 },
  ['kp6'] = { 326, 0, 0 },
  ['kp7'] = { 327, 0, 0 },
  ['kp8'] = { 328, 0, 0 },
  ['kp9'] = { 329, 0, 0 },
  ['kp.'] = { 330, 0, 0 },
  ['kp/'] = { 331, 0, 0 },
  ['kp*'] = { 332, 0, 0 },
  ['kp-'] = { 333, 0, 0 },
  ['kp+'] = { 334, 0, 0 },
  ['kpenter'] = { 335, 0, 0 },
  ['kp='] = { 336, 0, 0 },

  ['lshift'] = { 340, 0, 0 },
  ['lctrl'] = { 341, 0, 0 },
  ['lalt'] = { 342, 0, 0 },
  ['lgui'] = { 343, 0, 0 },
  ['rshift'] = { 344, 0, 0 },
  ['rctrl'] = { 345, 0, 0 },
  ['ralt'] = { 346, 0, 0 },
  ['rgui'] = { 347, 0, 0 },
  ['menu'] = { 348, 0, 0 }
}

local reverse = {}
for k, v in pairs(keymap) do
  local keycode = v[1]
  reverse[keycode] = k
end
for k, v in pairs(reverse) do
  keymap[k] = v
end

local keyboard = {}

function keyboard.isDown(key, ...)
  if not key then return false end
  local keycode = keymap[key][1]
  assert(keycode and type(keycode) == 'number', 'Unknown key: ' .. key)
  return C.glfwGetKey(window, keycode) == 1 or keyboard.isDown(...)
end

function keyboard.wasPressed(key, ...)
  if not key then return false end
  local keycode = keymap[key][1]
  assert(keycode and type(keycode) == 'number', 'Unknown key: ' .. key)
  local pressed = false
  keymap[key][3] = C.glfwGetKey(window, keycode)
  if keymap[key][2] == 0 and keymap[key][3] == 1 then
    pressed = true 
  else
    pressed = false
  end
  keymap[key][2] = keymap[key][3]
  return pressed
end

function keyboard.wasReleased(key, ...)
  if not key then return false end
  local keycode = keymap[key][1]
  assert(keycode and type(keycode) == 'number', 'Unknown key: ' .. key)
  local released = false
  keymap[key][3] = C.glfwGetKey(window, keycode)
  if keymap[key][2] == 1 and keymap[key][3] == 0 then
    released = true 
  else
    released = false
  end
  keymap[key][2] = keymap[key][3]
  return released
end

C.glfwSetKeyCallback(window, function(window, key, scancode, action, mods)
  if action ~= 2 and keymap[key] then
    lovr.event.push(action > 0 and 'keypressed' or 'keyreleased', keymap[key])
  end
end)

C.glfwSetCharCallback(window, function(window, char)
    lovr.event.push('textinput', string.char(char))
  end)

return keyboard
