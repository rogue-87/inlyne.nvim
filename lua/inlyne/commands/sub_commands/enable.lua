local temp = require("inlyne.lib.temp")
local runner = require("inlyne.lib.runner")

local function is_markdown_buffer()
	local bufnr = vim.api.nvim_get_current_buf()
	return vim.bo[bufnr].filetype == "markdown"
end

local M = {}

function M.impl()
	if runner.is_running then
		vim.notify("Inlyne is already running", vim.log.levels.INFO)
		return
	end

	if not is_markdown_buffer() then
		vim.notify("Currently opened file is not a markdown file", vim.log.levels.INFO)
		return
	end

	temp:create()
	runner:execute()
	vim.notify("Inlyne started", vim.log.levels.INFO)
end

return M
