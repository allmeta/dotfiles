function copyPath()
  local uri = mp.get_property("path")
  if uri == "-" then
    uri = mp.get_property("media-title")
  end
  local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(uri)
  pipe:close()
  mp.osd_message("Path yanked")
end
mp.add_key_binding("y", "copy-path", copyPath)
