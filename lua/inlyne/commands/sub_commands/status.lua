local M = {}

function M.impl(args, opts) end

function M.complete(subcmd_arg_lead)
	--  example
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
