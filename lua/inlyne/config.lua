---@class Inlyne.Config
---@field bin string path to inlyne binary
local default_config = {
	bin = "inlyne",
}

local M = { values = vim.deepcopy(default_config) }

---@param opts? Inlyne.Config
function M.set(opts)
	opts = opts or {}
	M.values = vim.tbl_deep_extend("force", default_config, opts)
end

return M
