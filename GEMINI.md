# ♊ Gemini Context

This file provides specialized context for the Gemini CLI agent when working on `inlyne.nvim`.

## 🛠️ Project Architecture

- **`lua/inlyne/init.lua`**: Entry point, handles `setup()` and command registration.
- **`lua/inlyne/config.lua`**: Configuration management using `vim.tbl_deep_extend`.
- **`lua/inlyne/lib/runner.lua`**: Manages the `inlyne` system process via `vim.fn.jobstart`.
- **`lua/inlyne/lib/temp.lua`**: Handles the creation and synchronization of the temporary markdown file.
- **`lua/inlyne/commands/`**: Implementation of user commands (`Inlyne enable`, `disable`, `toggle`).

## 📜 Development Guidelines

- **Neovim API**: Prefer `vim.api.*` and `vim.uv` (Luv) over older `vim.fn.*` where possible, unless `vim.fn` provides a significantly cleaner implementation (like `jobstart`).
- **Performance**: Markdown synchronization should be debounced. Avoid heavy disk writes on every keystroke.
- **Cleanup**: Always ensure processes are killed and temporary files are removed on buffer close or Vim exit.
- **Dependencies**: Keep the plugin lightweight. Avoid adding external Lua dependencies.

## 🧪 Testing

- **Reproduction**: Use `repro.lua` to test changes in a clean environment:
  ```bash
  nvim -u repro.lua some_file.md
  ```

## 🎯 Current Focus

Refer to `ROADMAP.md` for the current priority tasks.
