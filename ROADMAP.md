# 🗺️ Roadmap

This roadmap outlines the planned features and improvements for `inlyne.nvim`.

## 🟢 Phase 1: Core Enhancements
- [ ] **Live Real-time Preview**: Update the preview as you type using `TextChanged` and `TextChangedI` with a debounced writer to ensure performance.
- [ ] **Multi-Buffer Support**: Refactor state management to support multiple concurrent preview sessions for different markdown files.
- [ ] **Smart Auto-Cleanup**: Automatically terminate `inlyne` processes when the corresponding markdown buffer is closed or deleted.

## 🟡 Phase 2: Configuration & Customization
- [ ] **Native CLI Flags**: Expose `inlyne` options (theme, scale, opacity, etc.) in the plugin configuration.
- [ ] **Custom CSS Support**: Add a configuration option to pass a custom CSS file path to the viewer.
- [ ] **Fragment Navigation**: Support opening `inlyne` at a specific header or line.

## 🔵 Phase 3: Integration & UX
- [ ] **Scroll Sync**: (Experimental) Synchronize the scroll position between Neovim and the `inlyne` window.
- [ ] **Binary Management**: Add version checking in `:checkhealth` and more robust path detection.
- [ ] **Statusline Integration**: Provide a helper function to show if `inlyne` is active for the current buffer.
