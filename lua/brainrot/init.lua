local M = {}

M.config = {
	auto_start = false,
	video_source = nil,
	split_width = 50,
}

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	if not M.config.video_source then
		error("brainrot.nvim: You must specify a video_source in the setup function")
	end

	if M.config.auto_start then
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				M.start()
			end,
		})
	end
end

function M.start()
	-- Create a new split on the right
	vim.cmd("botright vnew")

	-- Set the width of the new split
	vim.cmd("vertical resize " .. M.config.split_width)

	-- Disable line numbers and other UI elements in the new buffer
	vim.wo.number = false
	vim.wo.relativenumber = false
	vim.wo.signcolumn = "no"

	-- Use a terminal to play the video
	local video_source = M.config.video_source
	vim.fn.termopen("mpv --loop " .. video_source)
end

return M
