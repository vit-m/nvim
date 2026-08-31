-- Нечёткий поиск (аналог fzf): файлы, текст по проекту, буферы и т.д.
-- telescope-fzf-native подключает нативный сортировщик fzf (написан на C) —
-- поведение и скорость как у настоящего fzf.
return {
  {
    "nvim-telescope/telescope.nvim",
    -- branch = "0.1.x", -- заброшена (последний коммит — май 2024): её предпросмотр
    -- дёргает старый API nvim-treesitter (ft_to_lang), которого нет в новом
    -- nvim-treesitter (main), и падает при попытке подсветить файл в превью.
    -- В master это уже переведено на нативный vim.treesitter.language.get_lang.
    branch = "master",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-tree/nvim-web-devicons",
    },
    cmd = "Telescope",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Найти файл" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Поиск по тексту в проекте" },
      {
        "<leader>fg",
        function()
          -- Забираем выделенный текст через регистр "v", не трогая основной регистр.
          -- Именно grep_string (а не live_grep с default_text) запускает поиск сразу:
          -- live_grep только подставляет текст в строку ввода и ждёт, пока пользователь
          -- реально что-то напечатает, — с готовым текстом результатов не покажет.
          local saved = vim.fn.getreg("v")
          vim.cmd('noautocmd normal! "vy')
          -- getreg может вернуть текст с завершающим "\n" (построчный yank) — обрезаем
          -- пробелы/переносы по краям, иначе искомая строка не совпадёт ни с чем.
          local selection = vim.fn.getreg("v"):gsub("^%s+", ""):gsub("%s+$", "")
          vim.fn.setreg("v", saved)
          require("telescope.builtin").grep_string({ search = selection })
        end,
        mode = "v",
        desc = "Поиск по выделенному тексту в проекте",
      },
      { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Поиск слова под курсором в проекте" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Список буферов" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Поиск по справке" },
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Недавние файлы" },
      { "<leader>fd", "<cmd>Telescope diagnostics<cr>", desc = "Диагностика LSP" },
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Символы (методы/классы) в файле" },
      {
        "<leader>fS",
        "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
        desc = "Символы (методы/классы) по всему проекту",
      },
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
      pcall(telescope.load_extension, "fzf")
    end,
  },
}
