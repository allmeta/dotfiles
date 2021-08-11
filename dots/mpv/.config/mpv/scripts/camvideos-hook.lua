mp.add_hook("on_load", 20, function ()
  local url = mp.get_property("stream-open-filename")
  if url:match('^https?://www.camvideos.tv/\\d+/') then
    video_url = io.popen('curl -s '.. url .. ' | rg -o "http://www.camvideos.tv/get_file/.*\\.mp4/"'):read("*a")
    print(video_url)
    mp.set_property('stream-open-filename', video_url)
  else
    return
  end
end)
