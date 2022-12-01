local capabilities = require('cmp_nvim_lsp').default_capabilities()
require'lspconfig'.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(_, bufnr)

    -- Helper for remapping
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    nmap('gd', vim.lsp.buf.definition, '[g]oto [d]efinition')
    nmap('gT', vim.lsp.buf.type_definition, '[g]oto [T]ype definition')
    nmap('gi', vim.lsp.buf.implementation,'[g]oto [i]mplementation') 
    nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
    nmap('<leader>dn', vim.diagnostic.goto_next, '[d]iagnostic [n]ext')
    nmap('<leader>dp', vim.diagnostic.goto_prev, '[d]iagnostic [p]rev')
    nmap('<leader>.', vim.lsp.buf.code_action, 'Code actions')
    nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')

    -- Autoformat on buf write
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
  end,
}
