--
-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/nvim-treesitter.lua
-- Description: nvim-treesitter configuration
require('nvim-treesitter.configs').setup {
    -- A list of parser names, or 'all'
    ensure_installed = {
        'python',
        'go',
        'dockerfile',
        'json',
        'yaml',
        'markdown',
        'html',
        'scss',
        'css',
        'vim',
        'lua',
        'bash',
        'javascript',
        'typescript',
        'tsx',
        'rust',
        'toml',
        'c',
        'cpp',
        'java',
    },

    highlight = {
        enable = true,
        use_languagetree = true
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false
    },
    refactor = {
        highlight_definitions = {
            enable = true
        },
        highlight_current_scope = {
            enable = false
        }
    }
}
