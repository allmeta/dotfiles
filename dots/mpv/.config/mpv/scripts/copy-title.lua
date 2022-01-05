function copyPath()
	local uri = mp.get_property("path")
	local pipe = io.popen("xclip -silent -in -selection clipboard", "w")
  pipe:write(uri)
  pipe:close()
	mp.osd_message("Path yanked")
end
mp.add_key_binding("y", "copy-path", copyPath)
