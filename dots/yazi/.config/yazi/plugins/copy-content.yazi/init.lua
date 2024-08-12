return {
	entry = function(self, args)
    ya.manager_emit("shell", {
      "cat $@ | wl-copy",
      block = false, orphan = false, confirm = true,
    })
	end,
}
