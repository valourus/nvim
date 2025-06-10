# Custom Neovim Configuration

This directory contains custom configurations for Neovim.

## Custom Keybindings

### LSP Code Actions

- `Alt+Enter` - Show code actions (like in WebStorm)
- `gra` - Show code actions (default kickstart binding)

## Custom Plugins

The custom plugins are located in the `plugins` directory.

## TypeScript Configuration

### Import Preferences

TypeScript imports are configured to be:
- Relative by default (using paths like `../components/Button`)
- Non-relative for packages (using paths like `react` instead of relative paths)

This configuration is set in `lua/custom/plugins/typescript-lsp.lua`.
