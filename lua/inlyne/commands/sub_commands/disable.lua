local manager = require("inlyne.lib.manager")

local M = {}

function M.impl()
	local bufnr = vim.api.nvim_get_current_buf()
	if not manager.is_active(bufnr) then
		vim.notify("Inlyne is not running for this buffer", vim.log.levels.INFO)
		return
	end

	manager.disable(bufnr)
	vim.notify("Inlyne stopped", vim.log.levels.INFO)
end

return M
