local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  -- 颜色方案
  { "tanvirtin/monokai.nvim" },
 {
    "mhartington/formatter.nvim",
    config = function()
      require("formatter").setup({
        filetype = {
          cpp = {
            function()
              return {
                exe = "/usr/bin/clang-format",  -- 使用 clang-format 进行格式化
                args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                stdin = true,
              }
            end
          },
        }
      })
    end
  }
  ,
  -- Competitest 插件
  {
    "xeluxee/competitest.nvim",
    dependencies = "MunifTanjim/nui.nvim",
    config = function()
      require('competitest').setup({
	      -- 本地配置文件名称
    local_config_file_name = ".competitest.lua",

    -- 浮动窗口配置
    floating_border = "rounded",
    floating_border_highlight = "FloatBorder",

    -- 选择器 UI 配置
    picker_ui = {
        width = 0.2,
        height = 0.3,
        mappings = {
            focus_next = { "j", "<down>", "<Tab>" },
            focus_prev = { "k", "<up>", "<S-Tab>" },
            close = { "<esc>", "<C-c>", "q", "Q" },
            submit = { "<cr>" },
        },
    },

    -- 编辑器 UI 配置
    editor_ui = {
        popup_width = 0.4,
        popup_height = 0.6,
        show_nu = true,
        show_rnu = false,
        normal_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>", "<C-i>" },
            save_and_close = "<C-s>",
            cancel = { "q", "Q" },
        },
        insert_mode_mappings = {
            switch_window = { "<C-h>", "<C-l>", "<C-i>" },
            save_and_close = "<C-s>",
            cancel = "<C-q>",
        },
    },

    -- 执行器 UI 配置
    runner_ui = {
        interface = "split", -- 改为分体式 UI
        selector_show_nu = false,
        selector_show_rnu = false,
        show_nu = true,
        show_rnu = false,
        mappings = {
            run_again = "R",
            run_all_again = "<C-r>",
            kill = "K",
            kill_all = "<C-k>",
            view_input = { "i", "I" },
            view_output = { "a", "A" },
            view_stdout = { "o", "O" },
            view_stderr = { "e", "E" },
            toggle_diff = { "d", "D" },
            close = { "q", "Q" },
        },
        viewer = {
            width = 0.5,
            height = 0.5,
            show_nu = true,
            show_rnu = false,
            close_mappings = { "q", "Q" },
        },
    },

    -- 浮动窗口布局
    popup_ui = {
        total_width = 0.8,
        total_height = 0.8,
        layout = {
            { 4, "tc" },
            { 5, { { 1, "so" }, { 1, "si" } } },
            { 5, { { 1, "eo" }, { 1, "se" } } },
        },
    },

    -- 分屏 UI 配置
    split_ui = {
        position = "right", -- 分屏显示在右侧
        relative_to_editor = true,
        total_width = 0.3,
        vertical_layout = {
            { 1, "tc" },
            { 1, { { 1, "so" }, { 1, "eo" } } },
            { 1, { { 1, "si" }, { 1, "se" } } },
        },
        total_height = 0.4,
        horizontal_layout = {
            { 2, "tc" },
            { 3, { { 1, "so" }, { 1, "si" } } },
            { 3, { { 1, "eo" }, { 1, "se" } } },
        },
    },

    -- 文件保存配置
    save_current_file = true,
    save_all_files = false,

    -- 编译配置
    compile_directory = ".",
    compile_command = {
        c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)", "-O2", "-lm", "-march=native", "-std=c++17", "-Wextra", "-Wshadow" } },
        rust = { exec = "rustc", args = { "$(FNAME)" } },
        java = { exec = "javac", args = { "$(FNAME)" } },
    },

    -- 运行配置
    running_directory = ".",
    run_command = {
        c = { exec = "./$(FNOEXT)" },
        cpp = { exec = "./$(FNOEXT)" },
        rust = { exec = "./$(FNOEXT)" },
        python = { exec = "python", args = { "$(FNAME)" } },
        java = { exec = "java", args = { "$(FNOEXT)" } },
    },

    -- 测试用例配置
    multiple_testing = -1,
    maximum_time = 5000,
    output_compare_method = "squish",
    view_output_diff = false,
    testcases_directory = ".",
    testcases_use_single_file = false,
    testcases_auto_detect_storage = true,
    testcases_single_file_format = "$(FNOEXT).testcases",
    testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).in",
    testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).out",

    -- Companion 配置
    companion_port = 27121,
    receive_print_message = true,

    -- 模板文件配置
    template_file = "/home/li-xufeng/source_code/templates/cpp_template.cpp", -- 指定模板文件路径
    received_files_extension = "cpp",
    received_problems_path = "$(CWD)/$(PROBLEM).cpp",
    received_problems_prompt_path = true,
    received_contests_directory = "$(CWD)",
    received_contests_problems_path = "$(PROBLEM).cpp",
    received_contests_prompt_directory = true,
    received_contests_prompt_extension = true,
    open_received_problems = true,
    open_received_contests = true,
    replace_received_testcases = false,
      })
    end,
  },

  -- Mason 和 LSP 配置
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  
  -- LSP 补全和图标插件
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init()
    end,
  },

  -- nvim-cmp 插件配置
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      require("config.nvim-cmp")
      local cmp = require'cmp'
      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'vsnip' },
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },

  -- LuaSnip 插件
  { "L3MON4D3/LuaSnip", version = "v2.*" },

  -- SmoothCursor 插件
  {
    "gen740/SmoothCursor.nvim",
    config = function()
      require('smoothcursor').setup()
    end,
  },
  -- Treesitter 配置
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "markdown", "markdown_inline" },
        highlight = { enable = true },
      }
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        progress = {
          enabled = true, -- 启用 LSP 进度
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true, -- 保留命令框功能
        command_palette = false,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
      notify = {
        enabled = true, -- 启用通知
      },
      routes = {
        {
          filter = { event = "msg_show", kind = "" },
          opts = {
            position = { row = "50%", col = "50%" }, -- 居中弹出
            size = { width = "80%", height = "30%" }, -- 调整大小
          },
        },
      },
      popupmenu = {
        backend = "nui", -- 使用 nui 支持
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify", -- 通知依赖
    },
    config = function(_, opts)
      require("noice").setup(opts)
      local notify = require("notify")
      notify.setup({
        stages = "fade_in_slide_out",
        timeout = 3000,
        background_colour = "#000000",
        fps = 60,
        render = "default",
        top_down = false, -- 确保通知居中
      })
      vim.notify = notify -- 替换默认通知函数
    end,
  },

  -- Lualine 配置
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        theme = "gruvbox",
        component_separators = "|",
        section_separators = "",
      },
    },
  },

  -- nvim-navic 配置
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
    opts = { highlight = true },
  },

  -- nvim-autopairs 配置
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
{
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- 图标支持
  config = function()
    require("nvim-tree").setup({
view = { width = 30 },
      filters = { dotfiles = true },
    })
  end,
},

{
  "romgrk/barbar.nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
},
{
  "glepnir/dashboard-nvim",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "Welcome to Neovim!",
        },
      },
    })
  end,
},

})

