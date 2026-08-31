-- Общие клавиши, не привязанные к конкретному плагину.
local map = vim.keymap.set

map("n", "<leader>w", "<cmd>write<cr>", { desc = "Сохранить файл" })
map("n", "<leader>q", "<cmd>quit<cr>", { desc = "Закрыть окно" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Убрать подсветку поиска" })

-- Удобная навигация по окнам
map("n", "<C-h>", "<C-w>h", { desc = "Окно слева" })
map("n", "<C-l>", "<C-w>l", { desc = "Окно справа" })
map("n", "<C-j>", "<C-w>j", { desc = "Окно снизу" })
map("n", "<C-k>", "<C-w>k", { desc = "Окно сверху" })

-- Переключение между открытыми файлами (буферами)
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Буфер назад" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Буфер вперёд" })
map("n", "<leader>bd", function()
  local buf = vim.api.nvim_get_current_buf()
  vim.cmd("bprevious")
  vim.cmd("bdelete " .. buf)
end, { desc = "Закрыть буфер (не закрывая окно)" })
