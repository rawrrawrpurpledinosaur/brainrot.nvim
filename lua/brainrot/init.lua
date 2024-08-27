local M = {}

M.config = {
	auto_start = false,
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

	vim.cmd("vertical resize 50")

	vim.cmd("setlocal nonumber no relativenumber signcolumn=no")

	local plugin_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)"):sub(1, -6)

	local video_path = plugin_path .. "brainrot.mp4"

	vim.fn.termopen("mpv --loop" .. video_path)
end

return M
