# nvim-конфиг

Конфигурация Neovim для Ruby и Python: подсветка и отступы (Treesitter),
LSP (`ruby_lsp`, `pyright`) с автодополнением, нечёткий поиск (Telescope,
как fzf) и файловый менеджер (nvim-tree). Список всех горячих клавиш — в
[CHEATSHEET.md](CHEATSHEET.md).

## Зависимости

Поставить **до** первого запуска nvim:

| Что | Зачем | macOS (brew) |
|---|---|---|
| Neovim 0.11+ | сам редактор | `brew install neovim` |
| git | клонирование lazy.nvim и плагинов | обычно уже есть |
| компилятор C + make | сборка парсеров Treesitter и fzf-native | Xcode CLT: `xcode-select --install` |
| `tree-sitter` CLI | сборка парсеров (nvim-treesitter, ветка main) | `brew install tree-sitter-cli` |
| `ripgrep` | `<leader>fg` — поиск по тексту в Telescope | `brew install ripgrep` |
| Node.js + npm | установка `pyright` через Mason | `brew install node` |
| Ruby + Bundler | установка `ruby_lsp` через Mason + сами Ruby-проекты | обычно уже есть (rbenv/mise/asdf) |
| Nerd Font | иконки в дереве файлов и Telescope | `brew install --cask font-jetbrains-mono-nerd-font`, затем выбрать этот шрифт в настройках терминала |

## Установка

```sh
git clone git@github.com:vit-m/nvim.git ~/.config/nvim
nvim
```

Первый запуск займёт чуть больше времени — при обычном (не `--headless`)
интерактивном старте автоматически:

1. `lazy.nvim` склонирует себя и поставит все плагины;
2. Treesitter скачает и соберёт парсеры для нужных языков;
3. Mason поставит `ruby_lsp` и `pyright`.

Дальше — как обычно. Проверить статус можно командами `:Lazy` (плагины) и
`:Mason` (LSP-серверы).

## Использование

```sh
cd мой_проект
nvim .
```

Дерево файлов при этом **не** открывается автоматически — открывайте вручную
по `<leader>e`, когда нужно осмотреть структуру проекта. Для навигации по коду
удобнее сразу `<leader>ff` (найти файл) / `<leader>fg` (grep по тексту).

Для Ruby-проектов `gd`/`gr`/автодополнение заработают только после
`bundle install` в самом проекте — `ruby_lsp` не подключится без установленного
бандла.

Полный список горячих клавиш — [CHEATSHEET.md](CHEATSHEET.md).
