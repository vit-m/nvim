-- LSP для Ruby и Python: диагностика, переход к определению, автодополнение и т.п.
-- Серверы ставятся автоматически через mason при первом запуске.
-- mason-lspconfig (automatic_enable, включено по умолчанию) сам вызовет
-- vim.lsp.enable() для установленных серверов — отдельный setup() не нужен.
return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    opts = {
      ensure_installed = {
        "ruby_lsp", -- официальный LSP-сервер для Ruby (от Shopify)
        "pyright", -- LSP-сервер для Python
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Общие возможности (для автодополнения) для всех LSP-серверов
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      -- Клавиши, действующие только в буфере с подключённым LSP-сервером.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          local map = vim.keymap.set
          map("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Перейти к определению" }))
          map("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Найти использования" }))
          map("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Документация" }))
          map("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Переименовать" }))
          map("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
          map("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Пред. диагностика" }))
          map("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "След. диагностика" }))
        end,
      })
    end,
  },
}
