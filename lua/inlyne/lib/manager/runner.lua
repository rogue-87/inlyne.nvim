local config = require("inlyne.config")

---@class Runner
---@field bin string path to inlyne executable or just "inlyne"
---@field path string path to the file to preview
---@field _job integer? internal job handle
---@field is_running boolean
local Runner = {}
Runner.__index = Runner

function Runner:new(path)
	local self = setmetatable({}, self)
	self.bin = config.values.bin
	self.path = path
	self._job = nil
	self.is_running = false
	return self
end

function Runner:execute()
	if vim.fn.filereadable(self.path) == 0 then
		vim.notify("Temporary file is not readable: " .. self.path, vim.log.levels.ERROR)
		return
	end

	local args = { self.bin, self.path }

	self._job = vim.fn.jobstart(args, {
		detach = true,
		on_exit = function(_, code)
			if code ~= 0 and code ~= 143 then
				vim.notify("Inlyne exited with code: " .. code, vim.log.levels.WARN)
			end

			self._job = nil
			self.is_running = false
		end,
		env = {
			HOME = os.getenv("HOME"),
			XDG_CONFIG_HOME = (os.getenv("HOME") .. "/.config"),
		},
	})

	if self._job > 0 then
		self.is_running = true
	else
		vim.notify("Failed to start inlyne", vim.log.levels.ERROR)
	end
end

function Runner:stop()
	if self._job then
		vim.fn.jobstop(self._job)
		self._job = nil
		self.is_running = false
	end
end

return Runner
