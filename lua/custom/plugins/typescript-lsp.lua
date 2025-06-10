return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      tsserver_file_preferences = {
        importModuleSpecifierEnding = 'minimal',
        importModuleSpecifierPreference = 'relative',
        importModuleSpecifierPreference_auto = 'relative-if-path',
      },
    },
  },
}
