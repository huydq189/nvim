return {
  {
    "Mofiqul/vscode.nvim",
    lazy = true,
    name = "vscode",
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "vscode",
    },
  },
}
