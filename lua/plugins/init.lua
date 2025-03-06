return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup {
        background_colour = "#FFFFFF",
        render = "compact",
      }
    end,
  },
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      skip_confirm_for_simple_edits = true,
    },
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
  },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author>",
      date_format = "%m-%d-%Y",
      virtual_text_column = 5,
    },
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "VeryLazy", -- You can make it lazy-loaded via VeryLazy, but comment out if thing doesn't work
    init = function()
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
    end,
    config = function()
      require("ufo").setup()
    end,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      local wilder = require "wilder"

      -- Enable wilder.nvim for specific command-line modes
      wilder.setup { modes = { "/", "?" } }

      -- Set up the popup menu renderer
      wilder.set_option(
        "renderer",
        wilder.popupmenu_renderer(wilder.popupmenu_palette_theme {
          modes = { ":", "/", "?" },
          border = "rounded",
          max_height = "75%", -- Max height of the popup
          min_height = 0, -- 0 allows dynamic height
          prompt_position = "top", -- Position of the input prompt
          reverse = 0, -- Set to 1 if you want the list reversed
        })
      )
    end,
    event = "CmdlineEnter",
    lazy = false,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua", -- optional
      "echasnovski/mini.pick", -- optional
    },
    cmd = "Neogit",
    config = true,
  },
  {
    "nvim-pack/nvim-spectre",
    config = function()
      require("spectre").setup()
    end,
    cmd = "Spectre",
  },
  {
    "ArcaneSpecs/HexEditor.nvim",
    cmd = "HexToggle",
    config = function()
      require("HexEditor").setup()
    end,
  },
  {
    "derektata/lorem.nvim",
    config = function()
      require("lorem").opts {
        sentenceLength = "medium",
        comma_chance = 0.2,
        max_commas_per_sentence = 2,
      }
    end,
    cmd = "LoremIpsum",
  },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    opts = {
      idle = {
        enabled = true,
        details = function(opts)
          return string.format("Taking a break from %s", opts.workspace)
        end,
        timeout = 300000,
      },
      buttons = {
        {
          label = function(opts)
            return opts.repo_url and "View Repository" or "View cord.nvim"
          end,
          url = function(opts)
            return opts.repo_url or "https://github.com/vyfor/cord.nvim"
          end,
        },
      },
      text = {
        editing = function(opts)
          local text = "Editing " .. opts.filename
          if vim.bo.modified then
            text = text .. "[+]"
          end
          return text
        end,
      },
    },
    event = "VeryLazy",
  },
  {
    "gbprod/yanky.nvim",
    opts = {},
    config = function()
      require("yanky").setup {
        ring = {
          history_length = 100,
          storage = "shada",
          storage_path = vim.fn.stdpath "data" .. "/databases/yanky.db",
          sync_with_numbered_registers = true,
          cancel_event = "update",
          ignore_registers = { "_" },
          update_register_on_cycle = false,
        },
        picker = {
          select = {
            action = nil,
          },
          telescope = {
            use_default_mappings = true,
            mappings = nil,
          },
        },
        system_clipboard = {
          sync_with_ring = true,
          clipboard_register = nil,
        },
        highlight = {
          on_put = true,
          on_yank = true,
          timer = 500,
        },
        preserve_cursor_position = {
          enabled = true,
        },
        textobj = {
          enabled = true,
        },
      }
    end,
    lazy = false,
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
  },
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   config = function()
  --     require("telescope").setup {
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown {},
  --         },
  --       },
  --     }
  --     require("telescope").load_extension "ui-select"
  --   end,
  --   lazy = false,
  -- },
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require "neocodeium"
      neocodeium.setup()
      vim.keymap.set("i", "<A-cr>", neocodeium.accept)
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        detection_methods = { "pattern" },
        patterns = { ".git" },
        ignore_lsp = {},
        show_hidden = false,
      }
    end,
    lazy = false,
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
      {
        "<leader>1",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>2",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>3",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "folke/twilight.nvim",
  },
  {
    "sontungexpt/url-open",
    cmd = "URLOpenUnderCursor",
    config = function()
      local status_ok, url_open = pcall(require, "url-open")
      if not status_ok then
        return
      end
      url_open.setup {}
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    config = function()
      require("lspsaga").setup {}
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "LspAttach",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  -- {
  --   "ggandor/leap.nvim",
  --   dependencies = {
  --     "tpope/vim-repeat",
  --   },
  --   config = function()
  --     require("leap").add_default_mappings = false
  --     vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
  --     vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
  --   end,
  --   lazy = false,
  -- },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/.local/share/obsidian_ChK",
        },
      },
      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
      },
      daily_notes = {
        folder = "journaling",
        date_format = "%Y-%m-%d",
        alias_format = "%B %-d, %Y",
        template = nil,
      },
      mappings = {
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      follow_url_func = function(url)
        vim.fn.jobstart { "xdg-open", url }
      end,
      wiki_link_func = function(opts)
        if opts.id == nil then
          return string.format("[[%s]]", opts.label)
        elseif opts.label ~= opts.id then
          return string.format("[[%s|%s]]", opts.id, opts.label)
        else
          return string.format("[[%s]]", opts.id)
        end
      end,
    },
  },
  {
    "mbbill/undotree",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "CRAG666/code_runner.nvim",
    config = function()
      require("code_runner").setup {
        filetype = {
          c = {
            "cd '$dir' &&",
            "gcc $fileName -o out.$fileNameWithoutExt -Ofast -march=native &&",
            "/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
            "echo '' &&",
            "cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
            "rm ./out.$fileNameWithoutExt &&",
            "rm ./memUsage.txt",
          },
          java = {
            "cd '$dir' &&",
            "javac $fileName &&",
            "java $fileNameWithoutExt &&",
            "rm ./$fileNameWithoutExt.class &&",
          },
          cpp = {
            "cd '$dir' &&",
            "g++ $fileName -std=c++23 -o out.$fileNameWithoutExt -Ofast -march=native -lfn&&",
            "/usr/bin/time -o memUsage.txt -f%M ./out.$fileNameWithoutExt &&",
            "echo '' &&",
            "cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' &&",
            "rm ./out.$fileNameWithoutExt &&",
            "rm ./memUsage.txt",
          },
          python = "python3 -u",
        },
      }
    end,
    cmd = "RunCode",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "vim",
        "lua",
        "markdown",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "c_sharp",
        "sql",
        "yaml",
        "xml",
        "tsx",
      },
      config = function()
        require("nvim-treesitter.configs").setup {
          ensure_installed = { "markdown", "markdown_inline" },
          highlight = {
            enable = true,
          },
        }
      end,
    },
    lazy = false,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = false,
  },
  {
    "nvim-tree/nvim-tree.lua",
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
}
