-- Set up mason to manage LSPs.
require('mason').setup()

local servers = {
  'rust_analyzer',
  'tsserver',
  'sumneko_lua',
  'yamlls',
  'dockerls',
  'astro',
}

require('mason-lspconfig').setup {
  ensure_installed = servers,
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local on_attach = function(_, bufnr)
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
  nmap('gi', vim.lsp.buf.implementation, '[g]oto [i]mplementation')
  nmap('<leader>rn', vim.lsp.buf.rename, '[r]e[n]ame')
  nmap('<leader>dn', vim.diagnostic.goto_next, '[d]iagnostic [n]ext')
  nmap('<leader>dp', vim.diagnostic.goto_prev, '[d]iagnostic [p]rev')
  nmap('<leader>.', vim.lsp.buf.code_action, 'Code actions')
  nmap('gr', require('telescope.builtin').lsp_references, '[g]oto [r]eferences')

  -- Autoformat on buf write
  vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
end

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

-- Turn on status information
require('fidget').setup {
  text = {
    spinner = 'moon',
  },
}

-- Do additional sumneko_lua setup for nvim config.
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

require('mason-null-ls').setup({
  ensure_installed = { 'stylua', 'prettier' },
  automatic_installation = true,
})

require 'mason-null-ls'.setup_handlers({})
