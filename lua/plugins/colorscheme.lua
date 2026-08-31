-- Расцветка: catppuccin — приятная, с хорошей подсветкой Ruby/Python из коробки.
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- загрузить раньше остальных плагинов
    opts = {
      flavour = "mocha", -- latte (светлая), frappe, macchiato, mocha (тёмная)
      integrations = {
        treesitter = true,
        cmp = true,
        native_lsp = { enabled = true },
        telescope = true,
        nvimtree = true,
        indent_blankline = { enabled = true },
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
