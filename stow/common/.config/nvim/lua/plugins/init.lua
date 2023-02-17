--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins.init.lua
-- Description: Custom plugins configuration
-- Custom plugin configs
local modules = {
   'plugins.statusline',
   'plugins.nvim-tree',
   'plugins.nvim-treesitter',
   'plugins.comment',
   'plugins.nvim-telescope',
   'plugins.nvim-autopairs',
   'plugins.colorscheme',
   'plugins.null-ls',
   'plugins.nvim-colorizer',
   'plugins.gitsigns',
   'plugins.neodev',
   'plugins.lsp', -- lsp goes last because other language plugins need it
}

for _, mod in ipairs(modules) do
   local ok, err = pcall(require, mod)
   if not ok then
      error(('Error loading %s...\n\n%s'):format(mod, err))
   end
end
