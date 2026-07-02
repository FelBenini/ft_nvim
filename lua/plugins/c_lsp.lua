return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<leader>cR", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders=true",
          },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Auto-generate compile_flags.txt for C/C++ projects
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          local cwd = vim.fn.getcwd()
          local compile_flags_file = cwd .. "/compile_flags.txt"
          
          -- Check if this looks like a C/C++ project and compile_flags.txt doesn't exist
          local has_c_files = vim.fn.glob(cwd .. "/**/*.[ch]", 0, 1)
          
          if #has_c_files > 0 and vim.fn.filereadable(compile_flags_file) == 0 then
            local header_dirs = {}
            local seen = {}
            
            -- Find all directories with headers
            local headers = vim.fn.globpath(cwd, "**/*.h", 0, 1)
            vim.list_extend(headers, vim.fn.globpath(cwd, "**/*.hpp", 0, 1))
            
            for _, header in ipairs(headers) do
              local header_dir = vim.fn.fnamemodify(header, ":h")
              if not seen[header_dir] then
                seen[header_dir] = true
                table.insert(header_dirs, header_dir)
              end
            end
            
            if #header_dirs > 0 then
              local flags = {}
              for _, dir in ipairs(header_dirs) do
                table.insert(flags, "-I" .. dir)
              end
              
              vim.fn.writefile(flags, compile_flags_file)
              vim.notify("Created compile_flags.txt with " .. #header_dirs .. " include paths", vim.log.levels.INFO)
            end
          end
        end,
      })
    end,
  },
}
