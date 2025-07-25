local temp = require("inlyne.lib.temp")
local runner = require("inlyne.lib.runner")

local M = {}

function M.impl()
	if runner.is_running then
		vim.notify("Inlyne is already running", vim.log.levels.INFO)
		return
	end

	temp:create()
	runner:execute()
end

return M
