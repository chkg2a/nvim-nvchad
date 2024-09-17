require "nvchad.mappings"

-- add yours here
local map = vim.keymap.set

-- telescope
local builtin = require "telescope.builtin"
map("n", "<leader>ff", builtin.find_files, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fg", builtin.live_grep, {})
map("n", "<leader>fb", builtin.buffers, {})
map("n", "<leader>fh", builtin.help_tags, {})
map("n", "<leader>fo", builtin.oldfiles, {})
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, {})
map("n", "<leader>cm", builtin.git_commits, {})
map("n", "<leader>gt", builtin.git_status, {})
map("n", "<leader>ma", builtin.marks, {})
map("n", "<leader>fa", function()
  builtin.find_files { follow = true, no_ignore = true, hidden = true }
end, {})

-- ui
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "j", "gj", { desc = "go down easy" })
map("n", "k", "gk", { desc = "go up easy" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Virtical Split" })
map("n", "<C-l>", "<C-w>l", { desc = "window left panel" })
map("n", "<C-h>", "<C-w>h", { desc = "window right panel" })
map("n", "<A-l>", "<C-w>l", { desc = "window left panel" })
map("n", "<A-h>", "<C-w>h", { desc = "window right panel" })
map("n", "<A-j>", "<C-w>j", { desc = "window up panel" })
map("n", "<A-k>", "<C-w>k", { desc = "window down panel" })
map("n", "<A-S-h>", "<cmd>2winc > <cr>", { desc = "increase window left panel" })
map("n", "<A-S-l>", "<cmd>2winc < <cr>", { desc = "increase window right panel" })
map("n", "<C-5>", "<cmd>vimgrep /\\w\\+/j % | copen<cr>", { desc = "quick fix" })
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Nvim Tree" })
map("n", "<leader>r", "<cmd> RunCode <CR>", { desc = "Run Code" })
map({ "n", "v" }, "<leader>]", ":Gen<CR>")

-- Handle Terminals
map({ "n", "t" }, "<C-8>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<C-9>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vsplit", size = "0.3" }
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<C-0>", function()
  require("nvchad.term").toggle { pos = "sp", id = "split" }
end, { desc = "Terminal Toggle Floating term" })

-- Yank Ring
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

map("n", "<leader>p", function()
  require("telescope").extensions.yank_history.yank_history()
end, { desc = "Yank History" })

-- undotree
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" })
map("n", "<A-u>", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" })

-- Zen
map("n", "<leader>z", "<cmd> ZenMode <CR>", { desc = "Zen Mode" })

-- URL
map("n", "gx", "<cmd>URLOpenUnderCursor <CR>", { desc = "Open URL" })

-- neovim-project-manager
map("n", "<leader>ss", "<cmd>Telescope neovim-project discover<cr>", { desc = "Open Projects" })
