-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
-- 让 Esc 退出终端模式
vim.api.nvim_set_keymap('t', '<C-[>', '<C-\\><C-n>', { noremap = true, silent = true })
-- 将 C-[ 映射为 Esc
vim.keymap.set('i', '<C-[>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-[>', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-[>', '<Esc>', { noremap = true, silent = true })
-- 将 <leader> 键设置为空格键
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"-- 为局部 leader 键设置相同值（可选）

-- 打开/关闭 Markdown 预览
vim.api.nvim_set_keymap('n', '<Leader>mp', ':MarkdownPreviewToggle<CR>', { noremap = true, silent = true })
