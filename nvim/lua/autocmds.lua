require "nvchad.autocmds"

vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function()
    require("configs.jdtls").start()
  end,
})
