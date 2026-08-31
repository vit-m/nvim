-- Подсветка синтаксиса и определение отступов на основе AST (нужнее regexp-подсветки).
-- Используется новый API nvim-treesitter (ветка main, требует Neovim 0.11+):
-- подсветка/отступы включаются штатными средствами Neovim через FileType-автокоманду.
local parsers = {
  "ruby",
  "python",
  "lua",
  "vim",
  "vimdoc",
  "bash",
  "markdown",
  "markdown_inline",
  "json",
  "yaml",
  "toml",
  "query",
}

local filetypes = {
  "ruby",
  "python",
  "lua",
  "vim",
  "help",
  "bash",
  "sh",
  "markdown",
  "json",
  "yaml",
  "toml",
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({
        install_dir = vim.fn.stdpath("data") .. "/site",
      })
      require("nvim-treesitter").install(parsers)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function()
          vim.treesitter.start()
          -- Отступы по грамматике языка (экспериментально, но заметно точнее smartindent)
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end,
  },
}
