local M = {}

function M.set()
	vim.api.nvim_create_autocmd("VimLeavePre", {
		group = vim.api.nvim_create_augroup("InlyneClose", { clear = true }),
		callback = function()
			local runner = require("inlyne.lib.runner")
			local temp = require("inlyne.lib.temp")

			if runner.is_running then
				runner:stop()
				temp:close()
			end
		end,
	})
end

return M
