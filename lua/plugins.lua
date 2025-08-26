local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
        {
          "bluz71/vim-moonfly-colors",
            config = function()
                vim.cmd.colorscheme("moonfly")
            end,
        },
        {
            "nvim-treesitter/nvim-treesitter", 
            branch = "master",
            lazy = false,
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    highlight = {
                        enable = true,
                    },
                    indent = {
                        enable = true,
                    },

                    ensure_installed = {
                        "lua", 
                        "vim", 
                        "python", 
                        "javascript",
                        "c",
                        "vimdoc",
                        "query"
                    },
                    
                    auto_install = true,

                    incremental_selection = {
                        enable = true,
                            keymaps = {
                                init_selection = "<Leader>ss", 
                                node_incremental = "<Leader>si",
                                scope_incremental = "<Leader>sc",
                                node_decremental = "<Leader>sd",
                            },
                    },

                })
            end,
        },

        {
            "nvim-treesitter/nvim-treesitter-textobjects",
            config = function()
                    require'nvim-treesitter.configs'.setup {
                      textobjects = {
                        select = {
                            enable = true,
                            lookahead = true,

                            keymaps = { 
                                ["af"] = "@function.outer",
                                ["if"] = "@function.inner",
                                ["ac"] = "@class.outer",        
                                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                                ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
                            },
                            selection_modes = {
                                ['@parameter.outer'] = 'v', 
                                ['@function.outer'] = 'V', 
                                ['@class.outer'] = '<c-v>', 
                            }, 
                          include_surrounding_whitespace = true,
                        },
                      },
                    }
                end,
        },  
        
        {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },

        {
            "neovim/nvim-lspconfig",
        },

        {
            "mason-org/mason.nvim",
            config = function()
                require("mason").setup()
            end
        },
 
        {
            "mason-org/mason-lspconfig.nvim",
            dependencies = {"mason.nvim"},
            config = function() 
                require("mason-lspconfig").setup({
                    handlers = {
                        function(server_name)
                            require("lspconfig")[server_name].setup({})
                        end,    
                    },
                })
            end,
        },

        {
            "saghen/blink.cmp",
            dependencies = { "rafamadriz/friendly-snippets" },
            version = "1.*",
            opts = {
                keymap = { preset = "super-tab" },
                appearance = {
                    nerd_font_variant = "mono"
                },

                completion = { documentation = { auto_show = true } },

                sources = {
                    default = {"lsp", "path", "snippets", "buffer"},
                    providers = {
                        lazdev = {
                            name = "LazyDev",
                            module = "lazydev.integrations.blink",
                            score_offset = 100,
                        },
                    },
                },

                fuzzy = { implementation = "prefer_rust_with_warning" }
            },
            opts_extend = { "sources.default" }
        },
    
        {
          {
            "folke/lazydev.nvim",
            ft = "lua", 
            opts = {
              library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
              },
            },
          },
        },

        {
            "nvim-tree/nvim-tree.lua",
            lazy = true,
            dependencies = {
              "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup({})
            end,
        },

        {
            "stevearc/oil.nvim",
            config = function()
                require("oil").setup({

                default_file_explorer = false,
                columns = {
                    "icons",
                    "permissions",
                    "size",
                    "mtime",
                },

                buff_options = {
                    buflisted = false,
                    bufhidden = "hide",
                },

                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = "false",
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 3,
                    concealcursor = "nvic",
                },

                delete_to_trash = false,
                skip_confirm_for_simple_edits = false,
                prompt_save_on_select_new_entry = true,
                cleanup_delay_ms = 2000,

                lsp_file_methods = {
                    enabled = true,
                    timeout_ms = 1000,
                    autosave_changes = false,
                },

                watch_for_changes = true,

                ssh = {
                   border = "rounded",
                },

                })
            end,

        }

    },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },

})
