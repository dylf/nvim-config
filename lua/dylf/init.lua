if vim.g.vscode then
    -- Add any vscode specific config
else
    -- Neovim specific plugins
    require("dylf.packer")
end

require("dylf.set")
require("dylf.remap")
