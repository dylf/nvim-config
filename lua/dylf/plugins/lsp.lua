return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- auto install LSPs
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      -- Status updates for LSP
      "j-hui/fidget.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      "nvim-lua/plenary.nvim",
      "folke/neodev.nvim",
    },
  },
  {
    "SmiteshP/nvim-navic",
    event = "VeryLazy",
    config = function()
      require("nvim-navic").setup({
        icons = {
          File = " ",
          Module = " ",
          Namespace = " ",
          Package = " ",
          Class = " ",
          Method = " ",
          Property = " ",
          Field = " ",
          Constructor = " ",
          Enum = " ",
          Interface = " ",
          Function = " ",
          Variable = " ",
          Constant = " ",
          String = " ",
          Number = " ",
          Boolean = " ",
          Array = " ",
          Object = " ",
          Key = " ",
          Null = " ",
          EnumMember = " ",
          Struct = " ",
          Event = " ",
          Operator = " ",
          TypeParameter = " ",
        },
      })
    end,
  },
}
