vim.api.nvim_create_augroup('cpp_template', { clear = true })
vim.api.nvim_create_autocmd('BufNewFile', {
  group = 'cpp_template',
  pattern = '*.cpp',
  command = '0r ~/source_code/templates/cpp_template.cpp'
})
-- 设置Normal高亮组的背景色为无
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- 如果你也想要设置终端背景色为无，可以添加以下行
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        callback = function()
            vim.fn.execute("silent! write")
            vim.notify("Autosaved!", vim.log.levels.INFO, {})
        end,
    })
package.path = package.path .. ";/usr/local/share/nvim/runtime/lua/?.lua"
package.path = package.path .. ";/usr/local/share/nvim/runtime/lua/?/init.lua"
vim.opt.runtimepath:append("/usr/local/share/nvim/runtime")
vim.g.neovide_font_size = 13.0
vim.g.neovide_hinting = "full"
vim.g.neovide_antialiasing = "subpixel"

-- 设置字体
vim.opt.guifont = "0xProto Nerd Font:h13"  -- 常规字体
vim.g.neovide_bold_font = "0xProto Nerd Font:h13:style=Bold"  -- 粗体
vim.g.neovide_italic_font = "0xProto Nerd Font:h13:style=Italic"  -- 斜体
vim.g.neovide_bold_italic_font = "0xProto Nerd Font:h13:style=Bold Italic"  -- 粗斜体im.opt.clipboard:append("unnamedplus")

vim.g.neovide_window_blurred = true

vim.g.neovide_transparency = 0.7
vim.g.tex_conceal = ""
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_strikethrough = 1
vim.g.im_markdown_autowrite = 1
-- 在 Lua 配置中自定义一个唯一的命令名称
vim.cmd('command! MarkdownPreviewCustom ...')

