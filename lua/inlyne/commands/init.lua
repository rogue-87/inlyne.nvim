local subcommand_tbl = require("inlyne.commands.sub_commands.init")

local M = {}

---@param opts table :h lua-guide-commands-create
function M.inlyne(opts)
	local fargs = opts.fargs
	local subcommand_key = fargs[1]
	-- Get the subcommand's arguments, if any
	local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
	local subcommand = subcommand_tbl[subcommand_key]
	if not subcommand then
		vim.notify("Inlyne: Unknown command: " .. subcommand_key, vim.log.levels.ERROR)
		return
	end
	-- Invoke the subcommand
	subcommand.impl(args, opts)
end

function M.completions(arg_lead, cmdline, _)
	-- Get the subcommand.
	local subcmd_key, subcmd_arg_lead = cmdline:match("^['<,'>]*Inlyne[!]*%s(%S+)%s(.*)$")
	if subcmd_key and subcmd_arg_lead and subcommand_tbl[subcmd_key] and subcommand_tbl[subcmd_key].complete then
		-- The subcommand has completions. Return them.
		return subcommand_tbl[subcmd_key].complete(subcmd_arg_lead)
	end
	-- Check if cmdline is a subcommand
	if cmdline:match("^['<,'>]*Inlyne[!]*%s+%w*$") then
		-- Filter subcommands that match
		local subcommand_keys = vim.tbl_keys(subcommand_tbl)
		return vim.iter(subcommand_keys)
			:filter(function(key)
				return key:find(arg_lead) ~= nil
			end)
			:totable()
	end
end

return M
