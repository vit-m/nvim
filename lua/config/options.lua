-- Базовые настройки редактора.
-- Отступы для конкретных языков (Ruby/Python) вынесены в ftplugin/*.lua,
-- здесь — только разумные значения по умолчанию для всех остальных файлов.

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Отключаем встроенный netrw: иначе `nvim <директория>` откроет его браузер
-- директорий вместо простого буфера, конфликтуя с nvim-tree.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 600 -- пауза, за которую нужно успеть ввести всю комбинацию с <leader>
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 4
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.undofile = true
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Отступы по умолчанию (переопределяются в ftplugin для ruby/python)
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.smartindent = true

opt.list = true
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
