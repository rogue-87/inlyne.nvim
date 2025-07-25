local path = require("inlyne.lib.temp").path
local config = require("inlyne.config")

---@class Runner
---@field bin string path to inlyne executable or just "inlyne"
---@field stdin string?
---@field stdout string?
---@field stderr string?
---@field _job integer? internal job handle
---@field is_running boolean
local Runner = {
	bin = config.values.bin,
	stdin = nil,
	stdout = nil,
	stderr = nil,
	_job = nil,
	is_running = false,
}

function Runner:execute()
	if vim.fn.filereadable(path) == 0 then
		vim.notify("Current file is not saved or does not exist", vim.log.levels.ERROR)
		return
	end

	local args = { self.bin, path }

	self._job = vim.fn.jobstart(args, {
		detach = true,
		stdout_buffered = true,
		stderr_buffered = true,
		on_stdout = function(_, data)
			self.stdout = table.concat(data, "\n")
		end,
		on_stderr = function(_, data)
			self.stderr = table.concat(data, "\n")
		end,
		on_exit = function(_, code)
			if code ~= 0 then
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
	else
		vim.notify("Inlyne runner is not running", vim.log.levels.INFO)
	end
end

return Runner
