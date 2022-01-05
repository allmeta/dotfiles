mp.add_hook("on_load", 20, function ()
  local url = mp.get_property("stream-open-filename")
  if url:match('^https?://hanime.tv/videos/hentai/') then
    video_url = io.popen('hanime '.. url):read("*a")
    print('loading video url: '..video_url)
    mp.set_property('stream-open-filename', video_url)
  else
    return
  end
end)
