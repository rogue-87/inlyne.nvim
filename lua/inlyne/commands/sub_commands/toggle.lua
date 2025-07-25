local runner = require("inlyne.lib.runner")
local enable = require("inlyne.commands.sub_commands.enable").impl
local disable = require("inlyne.commands.sub_commands.disable").impl

local M = {}

function M.impl()
	if not runner.is_running then
		enable()
	else
		disable()
	end
end

return M
