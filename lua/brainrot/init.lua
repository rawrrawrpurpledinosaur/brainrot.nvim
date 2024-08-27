local M = {}

-- Function to play the video
function M.play_video()
	vim.fn.jobstart({ "mpv", "--no-terminal", "--fullscreen", "brainrot.mp4" }, { detach = true })
end

-- Setup function for user options
function M.setup(opts)
	opts = opts or {}
	if opts.auto_play then
		vim.cmd([[
      augroup BrainrotAutoPlay
        autocmd!
        autocmd VimEnter * lua require('brainrot').play_video()
      augroup END
    ]])
	end
end

-- Return the module
return M
