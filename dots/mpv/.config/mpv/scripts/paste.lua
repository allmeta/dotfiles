function pasteLink()
  local pipe = io.popen("xclip -sel clip -o", "r")
  if not pipe then
    mp.osd_message("clipboard empty")
    return
  end
  a=pipe:read()
  mp.osd_message(a)
  mp.commandv("loadfile",a)
  pipe:close()
end
mp.add_key_binding("p", "paste-link", pasteLink)
