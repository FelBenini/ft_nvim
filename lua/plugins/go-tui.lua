return {
  {
    "grindlemire/go-tui",
    init = function()
      -- Register the .gsx filetype early so Neovim detects it before lazy loads the plugin
      vim.filetype.add({ extension = { gsx = "gsx" } })
      -- Add the nvim plugin subdirectory to the runtimepath
      vim.opt.rtp:prepend(vim.fn.stdpath("data") .. "/lazy/go-tui/editor/nvim")
    end,
    config = function()
      require("gsx").setup({
        lsp = {
          enabled = true,
          cmd = { "tui", "lsp" },
          log = "/tmp/gsx-lsp.log",
        },
      })
    end,
    ft = "gsx",
  },
}
