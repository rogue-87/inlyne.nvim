local config = require("inlyne.config")
local augroup = vim.api.nvim_create_augroup("Inlyne", { clear = true })

---@class Temp
---@field bufnr integer
---@field path string
---@field autocmd_id integer?
---@field timer any
local Temp = {}
Temp.__index = Temp

---@param path string
---@param bufnr integer
local function write_to_tempfile(path, bufnr)
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return
	end
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local content = table.concat(lines, "\n") .. "\n"

	local fd = vim.uv.fs_open(path, "w", 438)
	if not fd then
		vim.notify("Failed to create or open file: " .. path, vim.log.levels.ERROR)
		return
	end

	vim.uv.fs_write(fd, content, -1)
	vim.uv.fs_close(fd)
end

function Temp:new()
	local self = setmetatable({}, self)
	self.bufnr = nil
	self.path = (vim.fn.tempname() .. ".md")
	self.timer = vim.uv.new_timer()
	return self
end

function Temp:attach(bufnr)
	self:detach()
	self.bufnr = bufnr

	self.autocmd_id = vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "TextChanged", "TextChangedI" }, {
		group = augroup,
		buffer = self.bufnr,
		callback = function()
			self.timer:stop()
			self.timer:start(
				config.values.debounce_ms,
				0,
				vim.schedule_wrap(function()
					write_to_tempfile(self.path, self.bufnr)
				end)
			)
		end,
	})

	write_to_tempfile(self.path, self.bufnr)
end

function Temp:detach()
	if self.autocmd_id then
		vim.api.nvim_del_autocmd(self.autocmd_id)
		self.autocmd_id = nil
	end
	self.bufnr = nil
end

function Temp:close()
	self:detach()
	if self.timer:is_active() then
		self.timer:stop()
	end
	if not self.timer:is_closing() then
		self.timer:close()
	end
	if vim.fn.filereadable(self.path) == 1 then
		os.remove(self.path)
	end
end

return Temp
