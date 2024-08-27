local M = {}

M.config = {
	auto_start = false,
	split_width = 50,
}

function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})

	if M.config.auto_start then
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				M.start()
			end,
		})
	end
end

function M.start()
	vim.cmd("botright vnew")

	vim.cmd("vertical resize" .. M.config.split_width)

	local buf = vim.api.nvim_get_current_buf()

	vim.wo.number = false
	vim.wo.relativenumber = false
	vim.wo.signcolumn = "no"

	local plugin_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)"):sub(1, -6)

	local video_path = plugin_path .. "../brainrot.mp4"

	vim.fn.termopen("mpv --loop" .. video_path)
end

return M
