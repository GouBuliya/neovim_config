


vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.cpp",
  command = "FormatWrite",
})
