local Temp = require("inlyne.lib.manager.temp")
local Runner = require("inlyne.lib.manager.runner")

local M = {}

---@class Inlyne.Instance
---@field temp Temp
---@field runner Runner

---@type Inlyne.Instance?
M.instance = nil

---@param bufnr integer
function M.enable(bufnr)
	if not M.instance then
		local temp = Temp:new()
		local runner = Runner:new(temp.path)
		M.instance = {
			temp = temp,
			runner = runner,
		}
	end

	if M.instance.temp.bufnr == bufnr then
		if not M.instance.runner.is_running then
			M.instance.runner:execute()
		end
		return
	end

	M.instance.temp:attach(bufnr)

	if not M.instance.runner.is_running then
		M.instance.runner:execute()
	end

	-- cleanup on buffer delete
	vim.api.nvim_buf_attach(bufnr, false, {
		on_detach = function()
			if M.instance and M.instance.temp.bufnr == bufnr then
				M.disable()
			end
		end,
	})
end

---@param _ integer? (kept for API compatibility but ignored)
function M.disable(_)
	if not M.instance then
		return
	end

	M.instance.runner:stop()
	M.instance.temp:close()
	M.instance = nil
end

---@param bufnr integer
function M.toggle(bufnr)
	if M.is_active(bufnr) then
		M.disable()
	else
		M.enable(bufnr)
	end
end

---@param bufnr integer
---@return boolean
function M.is_active(bufnr)
	return M.instance ~= nil and M.instance.temp.bufnr == bufnr
end

return M