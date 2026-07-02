-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_user_command("Term", function()
  vim.cmd("split | terminal zsh") -- Change this last line with your preferred shell interpreter
end, {})

-- lua/config/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "svelte",
  callback = function()
    local ok = pcall(vim.treesitter.start, 0, "html")
    if not ok then
      vim.notify("HTML treesitter parser missing", vim.log.levels.WARN)
    end
  end,
})

vim.api.nvim_create_autocmd("VeryLazy", {
  callback = function()
    local sdk = os.getenv("VULKAN_SDK")
    if sdk then
      local flags_file = vim.fn.getcwd() .. "/compile_flags.txt"
      local flag = "-I" .. sdk .. "/include"
      local file = io.open(flags_file, "r")
      if not file then
        local f = io.open(flags_file, "w")
        if f then
          f:write(flag .. "\n")
          f:close()
        end
      else
        file:close()
      end
    end
  end,
})
