# 📓 Inlyne.nvim

Inlyne.nvim is a simple neovim plugin wrapper around the [inlyne](https://github.com/Inlyne-Project/inlyne) markdown viewer tool.

## ❗ Requirements

- Neovim >= 0.8
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
        { "<leader>it", "<cmd>Inlyne disable<cr>", desc = "Toggle Inlyne" },
    }, ]]
    opts = {},
}
```

## Configuration

> [!important]
> Make sure to run `:checkhealth inlyne` if something isn't working properly

<details>
    <summary>Default Options</summary>

```lua
    ---@class Inlyne.Config
    ---@field bin string
    local default_config = {
        bin = "inlyne" -- must be available in PATH
    }
```

</details>

## Usage

`Inlyne enable` : starts inlyne

`Inlyne disable` : stops inlyne

`Inlyne toggle`: toggles inlyne
