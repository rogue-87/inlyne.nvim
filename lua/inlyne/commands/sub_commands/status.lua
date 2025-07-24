local temp = require("inlyne.lib.temp")
local runner = require("inlyne.lib.runner")

local M = {}

function M.impl(args, opts)
	local kind = args[1] or "all"

	if kind == "all" or kind == "inlyne" then
		if runner.is_running then
			vim.notify("Inlyne is running (job ID: " .. runner._job .. ")", vim.log.levels.INFO)
		else
			vim.notify("Inlyne is not running", vim.log.levels.INFO)
		end

		if kind == "all" or kind == "tempfile" then
			local path = temp.path
			local exists = vim.fn.filereadable(path) == 1

			if exists then
				vim.notify("Tempfile exists at: " .. path, vim.log.levels.INFO)
			else
				vim.notify("Tempfile not found at: " .. path, vim.log.levels.WARN)
			end
		end
	end
end

function M.complete(subcmd_arg_lead)
	local subcmd_args = {
		"all",
		"tempfile",
		"inlyne",
	}
	return vim.iter(subcmd_args)
		:filter(function(arg)
			return arg:find(subcmd_arg_lead) ~= nil
		end)
		:totable()
end

return M
