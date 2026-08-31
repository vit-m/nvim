-- Файловый менеджер (дерево файлов сбоку).
-- Автооткрытие при `nvim .` отключено по просьбе — оно занимало единственное
-- окно целиком и мешало сразу пользоваться поиском. Открывается только вручную.
return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Файловый менеджер" },
      { "<leader>o", "<cmd>NvimTreeFocus<cr>", desc = "Фокус на файловом менеджере" },
    },
    opts = {
      view = { width = 32 },
      renderer = { group_empty = true },
      filters = { dotfiles = false },
      git = { enable = true },
    },
  },
}
