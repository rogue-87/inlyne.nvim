local temp = require("inlyne.lib.temp")
local runner = require("inlyne.lib.runner")

local M = {}

function M.impl(args, opts)
	if runner.is_running then
		runner:stop()
		temp:close()
		vim.notify("Inlyne stopped", vim.log.levels.INFO)
	else
		temp:create()
		runner:execute()
		vim.notify("Inlyne started", vim.log.levels.INFO)
	end
end

return M
