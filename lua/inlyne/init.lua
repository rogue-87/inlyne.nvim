local command = require("inlyne.commands.init")
local config = require("inlyne.config")
local autocmds = require("inlyne.autocmds")

---@class Inlyne
local Inlyne = {}

local has_setup = false
--- initializes inlyne with the given configuration
---@param opts? Inlyne.Config
function Inlyne.setup(opts)
	-- merge and store config
	config.set(opts)

	if vim.fn.has("nvim-0.8") == 0 then
		vim.notify("inlyne.nvim requires nvim 0.8 and newer", vim.log.levels.ERROR, { title = "inlyne.nvim" })
		return
	end

	autocmds.set()

	-- create Inlyne command and it's subcommands
	vim.api.nvim_create_user_command("Inlyne", command.inlyne, {
		nargs = "+",
		desc = "completions for Inlyne command",
		complete = command.completions,
		bang = true,
	})
end

return Inlyne
