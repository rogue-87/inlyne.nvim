local M = {}

function M.set()
	local group = vim.api.nvim_create_augroup("Inlyne", { clear = true })

	vim.api.nvim_create_autocmd("VimLeavePre", {
		group = group,
		callback = function()
			require("inlyne.lib.manager").disable()
		end,
	})

	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		callback = function(args)
			if vim.bo[args.buf].filetype ~= "markdown" then
				return
			end
			local manager = require("inlyne.lib.manager")
			if manager.instance then
				manager.enable(args.buf)
			end
		end,
	})
end

return M