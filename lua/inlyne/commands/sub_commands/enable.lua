local manager = require("inlyne.lib.manager")

local function is_markdown_buffer(bufnr)
	return vim.bo[bufnr].filetype == "markdown"
end

local M = {}

function M.impl()
	local bufnr = vim.api.nvim_get_current_buf()
	if manager.is_active(bufnr) then
		vim.notify("Inlyne is already running for this buffer", vim.log.levels.INFO)
		return
	end

	if not is_markdown_buffer(bufnr) then
		vim.notify("Currently opened file is not a markdown file", vim.log.levels.INFO)
		return
	end

	manager.enable(bufnr)
	vim.notify("Inlyne started", vim.log.levels.INFO)
end

return M
