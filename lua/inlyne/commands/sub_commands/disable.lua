local temp = require("inlyne.lib.temp")
local runner = require("inlyne.lib.runner")

local M = {}

function M.impl()
	if not runner.is_running then
		vim.notify("Inlyne is not running", vim.log.levels.INFO)
		return
	end

	runner:stop()
	temp:close()
	vim.notify("Inlyne stopped", vim.log.levels.INFO)
end

return M
