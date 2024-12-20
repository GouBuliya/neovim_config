
-- Enable the latex.nvim plugin
require('latex').setup({
  -- 设置编译器
  build = {
    executable = 'latexmk',
    args = {'-pdf', '%f'}, -- 以PDF格式编译
    continuous = true,  -- 使编译器持续运行以进行自动更新
  },

  -- 设置快捷键进行编译
  mappings = {
    compile = '<leader>lc', -- 设置快速编译命令
    stop = '<leader>ls', -- 设置停止编译的命令
  },

  -- 设置编译过程中的日志输出
  log = {
    show = true,  -- 显示日志信息
    level = 'info', -- 日志的级别（debug, info, error）
  },

  -- 设置预览选项
  preview = {
    viewer = 'zathura',  -- 设置PDF预览程序
    auto_open = true,    -- 在编译成功后自动打开预览
  }
})

-- 自动启动预览
vim.cmd [[
  autocmd FileType tex lua require('latex').preview()
]]
