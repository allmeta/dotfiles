-- swayimg config with nsxiv-style keybindings
-- Docs: /usr/share/doc/swayimg/CONFIG.md, defaults: /usr/share/swayimg/example.lua

swayimg.decoration = false
swayimg.dnd_button = "MouseExtra" -- free up right click for thumbnail mode
swayimg.viewer.default_scale = "optimal" -- like nsxiv: fit, but never upscale
swayimg.viewer.set_window_background(0xff000000)
swayimg.gallery.window_color = 0xff000000
swayimg.gallery.thumb_size = 160
swayimg.imagelist.adjacent = true -- opening one file loads its whole dir
swayimg.text.visible = false -- info hidden at start, toggle with i
swayimg.text.timeout = 0     -- don't auto-hide once shown

-- drop swayimg's default bindings so nothing conflicts
swayimg.viewer.bind_reset()
swayimg.gallery.bind_reset()
swayimg.slideshow.bind_reset()

--------------------------------------------------------------------------------
-- helpers
--------------------------------------------------------------------------------

-- shifted symbols may be reported with or without the Shift modifier,
-- so bind both forms
local function keys(...)
  local out = {}
  for _, k in ipairs({ ... }) do
    table.insert(out, k)
    table.insert(out, "Shift+" .. k)
  end
  return out
end

local function bind(modes, key, fn)
  for _, m in ipairs(modes) do
    swayimg[m].on_key(key, fn)
  end
end

local ALL = { "viewer", "gallery" }
local V = { "viewer" }

local function current()
  if swayimg.mode == "gallery" then
    return swayimg.gallery.get_image()
  end
  return swayimg.viewer.get_image()
end

local function goto_entry(entry)
  if not entry then return end
  if swayimg.mode == "gallery" then
    swayimg.gallery.select_path(entry.path)
  else
    swayimg.viewer.open_path(entry.path)
  end
end

-- jump n images forward/backward (nsxiv [ and ])
local function jump(n)
  local cur = current()
  if not cur then return end
  local list = swayimg.imagelist.get()
  for i, e in ipairs(list) do
    if e.path == cur.path then
      local t = math.max(1, math.min(#list, i + n))
      goto_entry(list[t])
      return
    end
  end
end

-- next/previous marked image (nsxiv N and P)
local function jump_marked(dir)
  local cur = current()
  if not cur then return end
  local list = swayimg.imagelist.get()
  local idx
  for i, e in ipairs(list) do
    if e.path == cur.path then idx = i break end
  end
  if not idx then return end
  local i = idx + dir
  while i >= 1 and i <= #list do
    if list[i].mark then goto_entry(list[i]) return end
    i = i + dir
  end
end

-- alternate image (nsxiv Ctrl-6)
local prev_path, cur_path
swayimg.viewer.on_image_change(function()
  local img = swayimg.viewer.get_image()
  if img and img.path ~= cur_path then
    prev_path, cur_path = cur_path, img.path
  end
end)

-- panning (nsxiv h/j/k/l pan by a fifth of the window)
local function pan(dx, dy)
  local win = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  swayimg.viewer.set_abs_position(
    math.floor(pos.x - dx * win.width / 5),
    math.floor(pos.y - dy * win.height / 5))
end

-- pan to edge (nsxiv H/J/K/L)
local function pan_edge(edge)
  local img = swayimg.viewer.get_image()
  if not img then return end
  local win = swayimg.get_window_size()
  local pos = swayimg.viewer.get_position()
  local s = swayimg.viewer.scale
  local w, h = img.width * s, img.height * s
  local x, y = pos.x, pos.y
  if edge == "left" then x = 0
  elseif edge == "right" then x = math.floor(win.width - w)
  elseif edge == "top" then y = 0
  elseif edge == "bottom" then y = math.floor(win.height - h)
  end
  swayimg.viewer.set_abs_position(x, y)
end

local function zoom(factor)
  local s = swayimg.viewer.scale
  swayimg.viewer.scale = s * factor
end

--------------------------------------------------------------------------------
-- common (image + thumbnail mode)
--------------------------------------------------------------------------------

bind(ALL, "q", function() swayimg.exit() end)
bind(ALL, "Escape", function() swayimg.exit() end)
bind(ALL, "f", function() swayimg.fullscreen = not swayimg.fullscreen end)
bind(ALL, "i", function() swayimg.text.visible = not swayimg.text.visible end)
bind(ALL, "a", function() swayimg.antialiasing = not swayimg.antialiasing end)

bind(ALL, "g", function()
  if swayimg.mode == "gallery" then swayimg.gallery.select("first")
  else swayimg.viewer.open("first") end
end)
bind(ALL, keys("G"), function()
  if swayimg.mode == "gallery" then swayimg.gallery.select("last")
  else swayimg.viewer.open("last") end
end)

bind(ALL, "r", function()
  if swayimg.mode == "gallery" then swayimg.gallery.reload()
  else swayimg.viewer.reload() end
end)

-- remove from list (not from disk)
bind(ALL, keys("D"), function()
  local img = current()
  if img then swayimg.imagelist.remove(img.path) end
end)

-- marks
bind(ALL, "m", function()
  if swayimg.mode == "gallery" then swayimg.gallery.mark_image()
  else swayimg.viewer.mark_image() end
end)
bind(ALL, keys("P"), function() jump_marked(-1) end)

-- switch modes
swayimg.viewer.on_key({ "Return", "t" }, function() swayimg.mode = "gallery" end)
swayimg.gallery.on_key({ "Return", "t" }, function() swayimg.mode = "viewer" end)

--------------------------------------------------------------------------------
-- thumbnail mode
--------------------------------------------------------------------------------

local G = swayimg.gallery
G.on_key({ "h", "Left" }, function() G.select("left") end)
G.on_key({ "j", "Down" }, function() G.select("down") end)
G.on_key({ "k", "Up" }, function() G.select("up") end)
G.on_key({ "l", "Right" }, function() G.select("right") end)
G.on_key({ "Ctrl+d", "Next" }, function() G.select("pgdown") end)
G.on_key({ "Ctrl+u", "Prior" }, function() G.select("pgup") end)
G.on_key({ "n", "space" }, function() G.select("right") end)
G.on_key({ "p", "BackSpace", "N", "Shift+N" }, function() G.select("left") end)
G.on_key(keys("bracketright"), function() jump(10) end)
G.on_key(keys("bracketleft"), function() jump(-10) end)
G.on_key(keys("plus"), function() G.thumb_size = G.thumb_size + 40 end)
G.on_key(keys("equal"), function() G.thumb_size = G.thumb_size + 40 end)
G.on_key("minus", function() G.thumb_size = math.max(40, G.thumb_size - 40) end)

G.on_mouse("MouseLeft", function()
  local m = swayimg.get_mouse_pos()
  G.select_at(m.x, m.y)
  swayimg.mode = "viewer"
end)
G.on_mouse("ScrollUp", function() G.select("up") end)
G.on_mouse("ScrollDown", function() G.select("down") end)
G.on_mouse("Ctrl+ScrollUp", function() G.thumb_size = G.thumb_size + 20 end)
G.on_mouse("Ctrl+ScrollDown", function() G.thumb_size = math.max(40, G.thumb_size - 20) end)

--------------------------------------------------------------------------------
-- image mode
--------------------------------------------------------------------------------

local Vw = swayimg.viewer

-- navigation
Vw.on_key({ "n", "space" }, function() Vw.open("next") end)
Vw.on_key({ "p", "BackSpace", "N", "Shift+N" }, function() Vw.open("prev") end)
Vw.on_key(keys("bracketright"), function() jump(10) end)
Vw.on_key(keys("bracketleft"), function() jump(-10) end)
Vw.on_key({ "Ctrl+6", "Ctrl+asciicircum", "Ctrl+Shift+asciicircum" }, function()
  if prev_path then Vw.open_path(prev_path) end
end)

-- animation frames
Vw.on_key("Ctrl+n", function() Vw.frame = Vw.frame + 1 end)
Vw.on_key("Ctrl+p", function()
  if Vw.frame > 0 then Vw.frame = Vw.frame - 1 end
end)
Vw.on_key("Ctrl+space", function() Vw.animation = not Vw.animation end)

-- panning
Vw.on_key({ "h", "Left" }, function() pan(-1, 0) end)
Vw.on_key({ "j", "Down" }, function() pan(0, 1) end)
Vw.on_key({ "k", "Up" }, function() pan(0, -1) end)
Vw.on_key({ "l", "Right" }, function() pan(1, 0) end)
Vw.on_key(keys("H"), function() pan_edge("left") end)
Vw.on_key(keys("J"), function() pan_edge("bottom") end)
Vw.on_key(keys("K"), function() pan_edge("top") end)
Vw.on_key(keys("L"), function() pan_edge("right") end)

-- zoom
Vw.on_key(keys("plus"), function() zoom(1.25) end)
Vw.on_key("minus", function() zoom(0.8) end)
Vw.on_key("equal", function() Vw.set_fix_scale("real") end)
Vw.on_key("w", function() Vw.set_fix_scale("optimal") end)
Vw.on_key(keys("W"), function() Vw.set_fix_scale("fit") end)
Vw.on_key("e", function() Vw.set_fix_scale("width") end)
Vw.on_key(keys("E"), function() Vw.set_fix_scale("height") end)

-- rotate / flip
Vw.on_key(keys("less"), function() Vw.rotate(270) end)
Vw.on_key(keys("greater"), function() Vw.rotate(90) end)
Vw.on_key(keys("question"), function() Vw.rotate(180) end)
Vw.on_key(keys("bar"), function() Vw.flip_horizontal() end)
Vw.on_key(keys("underscore"), function() Vw.flip_vertical() end)

-- slideshow (nsxiv s)
Vw.on_key("s", function() swayimg.mode = "slideshow" end)

-- mouse: left half = prev, right half = next, right click = thumbnails,
-- scroll = zoom at cursor, middle drag = pan
Vw.drag_button = "MouseMiddle"
Vw.on_mouse("MouseLeft", function()
  local m = swayimg.get_mouse_pos()
  local win = swayimg.get_window_size()
  if m.x < win.width / 2 then Vw.open("prev") else Vw.open("next") end
end)
Vw.on_mouse("MouseRight", function() swayimg.mode = "gallery" end)
Vw.on_mouse("ScrollUp", function()
  local m = swayimg.get_mouse_pos()
  Vw.set_abs_scale(Vw.scale * 1.25, m.x, m.y)
end)
Vw.on_mouse("ScrollDown", function()
  local m = swayimg.get_mouse_pos()
  Vw.set_abs_scale(Vw.scale * 0.8, m.x, m.y)
end)

--------------------------------------------------------------------------------
-- slideshow mode
--------------------------------------------------------------------------------

local S = swayimg.slideshow
S.on_key({ "s", "Escape" }, function() swayimg.mode = "viewer" end)
S.on_key("q", function() swayimg.exit() end)
S.on_key("f", function() swayimg.fullscreen = not swayimg.fullscreen end)
S.on_key({ "n", "space" }, function() S.open("next") end)
S.on_key({ "p", "BackSpace", "N", "Shift+N" }, function() S.open("prev") end)
