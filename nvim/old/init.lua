local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
'williamboman/mason-lspconfig.nvim',
   "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'nvimtools/hydra.nvim',
    },
    opts = {},
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
            {
                mode = { 'v', 'n' },
                '<Leader>m',
                '<cmd>MCstart<cr>',
                desc = 'Create a selection for selected text or word under the cursor',
            },
 
        },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    {
    "mason-org/mason.nvim",
    opts = {}
},
  {"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate"},
    {
        "saghen/blink.cmp",
        dependencies = { "rafamadriz/friendly-snippets" },
        version = "*",

        opts = {
            keymap = {
                preset = "enter",
                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback" },
                ["<Tab>"] = { "select_next", "fallback" },
                ["<S-Tab>"] = { "select_prev", "fallback" },
                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },
                ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
            },
            appearance = {
                nerd_font_variant = "mono",
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
            fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                keyword = { range = "prefix" },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                trigger = { show_on_trigger_character = true },
                documentation = {
                    auto_show = true,
                },
            },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
    {
  "leosmaia21/gcompilecommands.nvim",
  opts = {
    tmp_file_path = "$HOME/tmp/compilecommandsNEOVIM.json"
  },

  ft = { "c", "cpp" }, -- lazy load plugin only on C and C++ filetypes
}

    
})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup {}
        end
    },

})
vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])
