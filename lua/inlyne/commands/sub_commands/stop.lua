local runner = require("inlyne.lib.runner")
local temp = require("inlyne.lib.temp")

local M = {}

---@param args string[]
---@param opts vim.api.keyset.user_command
function M.impl(args, opts)
	if not runner.is_running then
		vim.notify("Inlyne is not running", vim.log.levels.INFO)
		return
	end

	runner:stop()
	temp:close()
	vim.notify("Inlyne stopped", vim.log.levels.INFO)
end

return M
