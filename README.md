# 📓 Inlyne.nvim

![Neovim](https://img.shields.io/badge/Neovim-0.11+-green.svg?style=flat&logo=neovim)
![License](https://img.shields.io/badge/License-MIT-blue.svg)

inlyne.nvim is a simple neovim plugin wrapper around the [inlyne](https://github.com/Inlyne-Project/inlyne) markdown viewer tool.

https://github.com/user-attachments/assets/35738769-763b-4def-b87f-dc100ea1f65e

## ❗ Requirements

- Neovim >= 0.11
- inlyne installed (`cargo install inlyne` or [pre-built binary](https://github.com/Inlyne-Project/inlyne/releases) )

## 📦 Installation

Install the plugin with your package manager of choice

[lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
    "rogue-87/inlyne.nvim",
    -- some optional keymaps
    --[[ keys = {
        { "<leader>ie", "<cmd>Inlyne enable<cr>", desc = "Enable Inlyne" },
        { "<leader>id", "<cmd>Inlyne disable<cr>", desc = "Disable Inlyne" },
        { "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
    }, ]]
    opts = {},
}
```

## Configuration

> [!important]
> Make sure to run `:checkhealth inlyne` if something isn't working properly

```lua
---@class Inlyne.Config
---@field bin string
---@field debounce_ms integer
local default_config = {
    bin = "inlyne", -- must be available in PATH
    debounce_ms = 200, -- delay in milliseconds for live preview updates
}
```

## Usage

`Inlyne enable` : starts inlyne

`Inlyne disable` : stops inlyne

`Inlyne toggle`: toggles inlyne
