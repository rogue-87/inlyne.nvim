# 📓 Inlyne.nvim

Inlyne.nvim is a simple neovim plugin wrapper around the [inlyne](https://github.com/Inlyne-Project/inlyne) markdown viewer tool.

![Inlyne in Action](https://private-user-images.githubusercontent.com/68822497/529936435-0174e405-48a0-40e2-996a-9518f284ff0b.webp?jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTUiLCJleHAiOjE3NjY4NjE5OTEsIm5iZiI6MTc2Njg2MTY5MSwicGF0aCI6Ii82ODgyMjQ5Ny81Mjk5MzY0MzUtMDE3NGU0MDUtNDhhMC00MGUyLTk5NmEtOTUxOGYyODRmZjBiLndlYnA_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBVkNPRFlMU0E1M1BRSzRaQSUyRjIwMjUxMjI3JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDI1MTIyN1QxODU0NTFaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1mYjMyZmEyOGI5ZDM1MDY3NTA0M2Y4MTY5YmVmMGY5ZjRiZmFhNTkxOTZjMTIxZmIwYzY0NjAwYmI4MGYzODE2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCJ9.Ies83oMdR8DfeGKcyqcny_bNMW4FN0mhgDr9GqcSjrA)



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
        { "<leader>it", "<cmd>Inlyne toggle<cr>", desc = "Toggle Inlyne" },
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
