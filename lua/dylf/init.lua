if vim.g.vscode then
    -- Add any vscode specific config
else
    -- Neovim specific plugins
    require("dylf.packer")
    vim.g.netrw_banner = 0
end

require("dylf.set")
require("dylf.remap")
