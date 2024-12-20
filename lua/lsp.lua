require('mason').setup()
require('mason-lspconfig').setup({
    -- 自动安装的语言服务器列表
    ensure_installed = {
        'pylsp',          -- Python
        'lua_ls',         -- Lua
        'clangd',         -- C/C++
        'texlab',
    },
})
require('mason-lspconfig').setup_handlers({
    -- 默认处理程序
    function (server_name)
        require("lspconfig")[server_name].setup({})
    end,

    -- 为特定的 LSP 服务器提供自定义配置
    ["lua_ls"] = function()
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' } -- 将 'vim' 识别为全局变量
                    }
                }
            }
        })
    end,

    ["clangd"] = function()
        require('lspconfig').clangd.setup({
            cmd = {
                "clangd",
                "--offset-encoding=utf-16", -- 确保与 Neovim 的编码一致
                "--query-driver=/usr/bin/g++-10", -- 指定查询驱动器（可选）
                "--compile-commands-dir=build" -- 指定编译命令文件的位置（可选）
            },
            on_attach = function(client, bufnr)
                -- 你可以在这里添加一些键绑定或钩子
            end,
            capabilities = require('cmp_nvim_lsp').default_capabilities(),
            -- 其他配置选项...
        })
    end,
                


})
-- 安装 nvim-cmp 和相关依赖
local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    }),
    experimental = {
    ghost_text = true,  -- 启用 Ghost Text 功能，类似于 zsh-autosuggestions
  },
})

-- 设置 LSP 诊断显示
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = true,
})

-- 定义诊断符号
local signs = { Error = "✗ ", Warn = "⚠ ", Hint = "⚑ ", Info = "ℹ " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end



