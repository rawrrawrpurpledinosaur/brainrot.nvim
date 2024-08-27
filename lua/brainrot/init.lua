local M = {}

-- Function to play the video within a Neovim buffer
function M.play_video()
	-- Open a new terminal buffer and play the video using mpv's --vo=tct
	vim.cmd("new | term mpv --vo=tct --really-quiet brainrot.mp4")
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
