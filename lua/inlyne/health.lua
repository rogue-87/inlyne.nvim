local M = {}

function M.check()
	local has_inlyne = vim.fn.executable("inlyne") == 1
	if has_inlyne then
		vim.health.ok("inlyne binary is available in PATH")
	else
		vim.health.error("inlyne binary is not available. Please install it.")
	end

	if vim.fn.has("nvim-0.8") == 1 then
		vim.health.ok("Neovim version is compatible (>= 0.8)")
	else
		vim.health.warn("Neovim < 0.8 may not be fully supported")
	end
end

return M
