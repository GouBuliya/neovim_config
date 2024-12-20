
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- 使用LuaSnip扩展
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- 使用LuaSnip源
  },
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})

-- 配置数学公式的Snippets
luasnip.add_snippets('markdown', {
  luasnip.parser.parse_snippet("math", "$${1}$$"),  -- 插入 LaTeX 数学公式模板
  luasnip.parser.parse_snippet("inline", "$${1}$"), -- 插入内联数学公式模板
})

cmp.setup.filetype('markdown', {
  sources = cmp.config.sources({
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
  }),
  mapping = cmp.mapping.preset.insert({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
})
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
  },
})


local ls = require("luasnip")

ls.add_snippets("tex", {
    ls.parser.parse_snippet("begin", "\\begin{${1:block}}${0}\\end{$1}"), -- 创建环境
    ls.parser.parse_snippet("frac", "\\frac{${1:num}}{${2:den}}"), -- 插入分式
    ls.parser.parse_snippet("sqrt", "\\sqrt{${1:value}}"), -- 插入平方根
    ls.parser.parse_snippet("sum", "\\sum_{${1:i=1}}^{${2:n}} ${3:expression}"), -- 插入求和
})




cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- 如果使用了 LuaSnip
    end,
  },
  sources = {
    { name = 'nvim_lsp' }, -- LSP 补全源
    { name = 'buffer' }, -- 缓冲区补全
    { name = 'path' }, -- 路径补全
    { name = 'luasnip' }, -- LuaSnip 补全源
  },
})



ls.add_snippets("markdown", {
  ls.parser.parse_snippet("frac", "\\frac{${1:num}}{${2:den}}"), -- 插入分式
  ls.parser.parse_snippet("sqrt", "\\sqrt{${1:value}}"), -- 插入平方根
  ls.parser.parse_snippet("sum", "\\sum_{${1:i=1}}^{${2:n}} ${3:expression}"), -- 插入求和
  ls.parser.parse_snippet("int", "\\int_{${1:0}}^{${2:∞}} ${3:expression} dx"), -- 插入积分
})
