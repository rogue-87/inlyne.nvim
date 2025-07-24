local command = require("inlyne.commands.init")

---@class Inlyne
local Inlyne = {}

local has_setup = false
--- initializes inlyne with the given configuration and initiates the download
--- for the markdown viewer prebuilt binaries, if necessary.
---@param opts? Inlyne.Config
function Inlyne.setup(opts)
	--- merge user options with the defaults
	opts = opts or {}

	--- check if user is running a supported nvim version
	if vim.fn.has("nvim-0.11") == 0 then
		vim.notify("inlyne.nvim requires nvim 0.11 and newer", vim.log.levels.ERROR, { title = "inlyne.nvim" })
		return
	end

	-- create Inlyne commands and it's subcommands
	vim.api.nvim_create_user_command("Inlyne", command.inlyne, {
		nargs = "+",
		desc = "completions for Inlyne command",
		complete = command.completions,
		bang = true,
	})
end

return Inlyne
