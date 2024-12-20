
-- 自动启动预览窗口，默认值：0
vim.g.mkdp_auto_start = 0

-- 当切换到其他 buffer 时自动关闭预览窗口，默认值：1
vim.g.mkdp_auto_close = 1

-- 设置为 1，保存或离开插入模式时自动刷新 Markdown，默认值：0
vim.g.mkdp_refresh_slow = 0

-- 设置为 1，MarkdownPreview 命令可用于所有文件，默认值：0
vim.g.mkdp_command_for_global = 0

-- 设置为 1，预览服务器可供网络中的其他设备访问，默认值：0
vim.g.mkdp_open_to_the_world = 0

-- 使用自定义 IP 打开预览页面，适用于远程 Vim 工作并在本地浏览器中预览
vim.g.mkdp_open_ip = ''

-- 设置使用的浏览器来打开预览页面
vim.g.mkdp_browser = ''

-- 设置为 1，在打开预览页面时在命令行显示预览页的 URL，默认值：0
vim.g.mkdp_echo_preview_url = 0

-- 自定义 Vim 函数名称来打开预览页面，此函数将接收 URL 作为参数
vim.g.mkdp_browserfunc = ''

-- Markdown 渲染选项
vim.g.mkdp_preview_options = {
    mkit = {},
    katex = {},
    uml = {},
    maid = {},
    disable_sync_scroll = 0,
    sync_scroll_type = 'middle',
    hide_yaml_meta = 1,
    sequence_diagrams = {},
    flowchart_diagrams = {},
    content_editable = false,
    disable_filename = 0,
    toc = {}
}

-- 自定义 Markdown 样式，必须是绝对路径
vim.g.mkdp_markdown_css = ''

-- 自定义高亮样式，必须是绝对路径
vim.g.mkdp_highlight_css = ''

-- 使用自定义端口启动服务器，或为空表示随机端口
vim.g.mkdp_port = ''

-- 预览页面标题，${name} 将被替换为文件名
vim.g.mkdp_page_title = '「${name}」'

-- 使用自定义路径存储图片
vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- 识别的文件类型
vim.g.mkdp_filetypes = {'markdown'}

-- 设置默认主题（dark 或 light），系统偏好设置会自动决定主题
vim.g.mkdp_theme = 'dark'

-- 合并预览窗口，默认值：0
-- 如果启用，它会重用之前打开的预览窗口，确保设置 let g:mkdp_auto_close = 0
vim.g.mkdp_combine_preview = 0

-- 当更改 Markdown buffer 时自动刷新合并预览内容，仅在 g:mkdp_combine_preview 为 1 时生效
vim.g.mkdp_combine_preview_auto_refresh = 1
