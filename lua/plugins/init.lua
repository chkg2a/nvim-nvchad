return {
  {
    "derektata/lorem.nvim",
    config = function()
      require("lorem").opts {
        sentenceLength = "medium",
        comma_chance = 0.2,
        max_commas_per_sentence = 2,
      }
    end,
    lazy = false,
  },
  {
    "andweeb/presence.nvim",
    config = function()
      require("presence").setup {
        auto_update = true,
        neovim_image_text = "The One True Text Editor",
        main_image = "file",
        client_id = "793271441293967371",
        log_level = nil,
        debounce_timeout = 4,
        enable_line_number = false,
        blacklist = {},
        buttons = false,
        file_assets = {},
        show_time = true,

        -- Rich Presence text options
        editing_text = "Editing %s",
        file_explorer_text = "Browsing %s",
        git_commit_text = "Committing changes",
        plugin_manager_text = "Managing plugins",
        reading_text = "Reading %s",
        workspace_text = "Working on %s",
        line_number_text = "Line %s out of %s",
      }
    end,
    lazy = false,
  },
  {
    "gelguy/wilder.nvim",
    config = function()
      require("wilder").setup {}
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  -- {
  --   "m4xshen/hardtime.nvim",
  --   dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
  --   opts = {},
  --   lazy = false,
  -- },
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
    lazy = false,
  },
  {
    "wakatime/vim-wakatime",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {},
          },
        },
      }
      require("telescope").load_extension "ui-select"
    end,
    lazy = false,
  },
  -- {
  --   "David-Kunz/gen.nvim",
  --   config = function()
  --     require("gen").setup {}
  --   end,
  --   lazy = false,
  -- },
  -- {
  --   "monkoose/neocodeium",
  --   event = "VeryLazy",
  --   config = function()
  --     local neocodeium = require "neocodeium"
  --     neocodeium.setup()
  --     vim.keymap.set("i", "<A-cr>", neocodeium.accept)
  --   end,
  -- },
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
    "f-person/git-blame.nvim",
    lazy = false,
  },
  {
    "folke/twilight.nvim",
  },
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
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
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "ggandor/leap.nvim",
    dependencies = {
      "tpope/vim-repeat",
    },
    config = function()
      require("leap").add_default_mappings = false
      vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)")
      vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)")
    end,
    lazy = false,
  },
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
        folder = "dailies",
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
            "cat memUsage.txt | awk '{printf \"Memory Usage: %.1f MB\\n\", $1/1024}' -Lfn&&",
            "rm ./out.$fileNameWithoutExt &&",
            "rm ./memUsage.txt",
          },
          cpp = {
            "cd '$dir' &&",
            "g++ $fileName -o out.$fileNameWithoutExt -Ofast -march=native -std=c++20 -lfn&&",
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
    lazy = false,
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
    lazy = false,
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    opts = require "configs.conform",
  },
}
