return {
  "ThePrimeagen/harpoon",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("harpoon").setup()
    local ui = require("harpoon.ui")
    local mark = require("harpoon.mark")

    vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Harpoon: quick menu" })
    vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Harpoon: add file" })
    vim.keymap.set("n", "<leader>hr", mark.rm_file, { desc = "Harpoon: remove file" })
    vim.keymap.set("n", "<leader>hx", mark.clear_all, { desc = "Harpoon: clear all" })

    -- Set keymaps for pinning and going to the first five marks
    local set_mark_at = function (num)
      return function() mark.set_current_at(num) end
    end

    local goto = function (num)
      return function() ui.nav_file(num) end
    end

    for i = 1, 5 do
      local lhs = string.format("<leader>%s", i)
      local desc = string.format("Harpoon: Goto %s", i)
      vim.keymap.set("n",  lhs, goto(i), { desc = desc })
      lhs = string.format("<leader>h%s", i)
      desc = string.format("Harpoon: mark at %s", i)
      vim.keymap.set("n",  lhs, set_mark_at(i), { desc = desc })
    end
  end,
}
