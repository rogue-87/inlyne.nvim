local config = require("inlyne.config")

local autocmd_id
local augroup = vim.api.nvim_create_augroup("Inlyne", { clear = true })

---@param path string
local function write_to_tempfile(path)
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	local content = table.concat(lines, "\n") .. "\n"

	local fd = vim.uv.fs_open(path, "w", 438)
	if not fd then
		vim.notify("Failed to create or open file: " .. path, vim.log.levels.ERROR)
		return
	end

	vim.uv.fs_write(fd, content, -1, function(err)
		if err then
			vim.notify("Write failed: " .. err, vim.log.levels.ERROR)
		end
		vim.uv.fs_close(fd)
	end)
end

---@class Temp
---@field path string
local Temp = {
	path = config.values.temp_path,
}

function Temp:create()
	autocmd_id = vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPost", "BufWritePost" }, {
		group = augroup,
		pattern = "*.md",
		callback = function()
			write_to_tempfile(self.path)
		end,
	})

	write_to_tempfile(self.path)
end

function Temp:close()
	if autocmd_id then
		vim.api.nvim_del_autocmd(autocmd_id)
		autocmd_id = nil
	end
end

return Temp
