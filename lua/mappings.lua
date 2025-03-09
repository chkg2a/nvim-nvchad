require "nvchad.mappings"


vim.api.nvim_set_keymap("n", "<leader>ro", [[:lua ReplaceChar()<CR>]], { noremap = true, silent = false })

function ReplaceChar()
    local char_to_replace = vim.fn.input("Replace: ")
    local new_char = vim.fn.input("With: ")
    if char_to_replace ~= "" and new_char ~= "" then
        vim.cmd(string.format("s/%s/%s/g", char_to_replace, new_char))
        vim.cmd("nohlsearch")
    end
end

-- show the effects of a search / replace in a live preview window
vim.o.inccommand = "split"

-- add yours here
local map = vim.keymap.set

-- Remove default mappings
map("n", "<A-h>", "")
map("n", "<A-v>", "")
map("n", "<C-n>", "")
map("t", "<C-x>","")
map("n", "<leader>v","")
map("n", "<leader>h","")
map({ "n", "t" }, "<leader>h","")
map({ "n", "t" }, "<leader>h","")
map({ "n", "t" }, "<A-i>", "")
map("n", "<leader>b", "")

-- ui
map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("n", "j", "gj", { desc = "go down easy" })
-- map("n", "k", "gk", { desc = "go up easy" })
map("n", "<leader>v", "<cmd>vsplit<cr>", { desc = "Virtical Split" })
map({ "n", "t" }, "<C-l>", "<C-w>l", { desc = "window left panel" })
map({ "n", "t" }, "<C-h>", "<C-w>h", { desc = "window right panel" })
map({ "n", "t" }, "<A-l>", "<C-w>l", { desc = "window left panel" })
map({ "n", "t" }, "<A-h>", "<C-w>h", { desc = "window right panel" })
map({ "n", "t" }, "<A-j>", "<C-w>j", { desc = "window up panel" })
map({ "n", "t" }, "<A-k>", "<C-w>k", { desc = "window down panel" })
map({ "n", "t" }, "<A-S-h>", "<cmd>2winc > <cr>", { desc = "increase window left panel" })
map({ "n", "t" }, "<A-S-l>", "<cmd>2winc < <cr>", { desc = "increase window right panel" })
map("n", "<C-5>", "<cmd>vimgrep /\\w\\+/j % | copen<cr>", { desc = "quick fix" })
map("n", "<leader>E", "<cmd> NvimTreeToggle <CR>", { desc = "Nvim Tree" })
map("n", "<leader>e", "<cmd> Oil <CR>", { desc = "Oil" })
map("n", "<leader>r", ":w <CR> <cmd> RunCode <CR>", { desc = "Run Code" })
-- map({ "n", "v" }, "<leader>]", ":Gen<CR>")

-- Handle Terminals
map({ "n", "t" }, "<C-8>", function()
  vim.cmd("wincmd l")  -- Move to the right window
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<C-9>", function()
  vim.cmd("wincmd l")  -- Move to the right window
  require("nvchad.term").toggle { pos = "vsp", id = "vsplit", size = "0.3" }
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<C-0>", function()
  vim.cmd("wincmd l")  -- Move to the right window
  require("nvchad.term").toggle { pos = "sp", id = "split" }
end, { desc = "Terminal Toggle Floating term" })

-- Yank Ring
map({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
map({ "n", "x" }, "P", "<Plug>(YankyPutBefore)") map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)") map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")

map("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
map("n", "<c-n>", "<Plug>(YankyNextEntry)")

map("n", "<leader>p", function()
  require("telescope").extensions.yank_history.yank_history()
end, { desc = "Yank History" })

-- undotree
-- map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" })
map("n", "<A-u>", "<cmd>UndotreeToggle<cr>", { desc = "Undo Tree" })

-- Zen
map("n", "<leader>z", "<cmd> ZenMode <CR>", { desc = "Zen Mode" })

-- URL
map("n", "gx", "<cmd>URLOpenUnderCursor <CR>", { desc = "Open URL" })

-- -- neovim-project-manager
map("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Open Projects" })

-- obsidian
map("n", "<A-s>", "<cmd> ObsidianSearch <CR>")
map("n", "<A-i>", "<cmd> ObsidianToday <CR>")
map("n", "<A-t>", "<cmd> ObsidianTemplate <CR>")
map("n", "<A-o>", "<cmd> ObsidianOpen <CR>")
map("n", "<A-p>", "<cmd> ObsidianTOC <CR>")
map("n", "<A-v>", "<cmd> ObsidianBacklinks <CR>")
map("n", "<A-b>", "<cmd> ObsidianBacklinks <CR>")
map("n", "<A-n>", "<cmd> ObsidianNew <CR>")
map("v", "<A-l>","<cmd> ObsidianLinkNew <CR>")

-- HexEditor
map("n", "<leader>h","<cmd> HexToggle <CR>")

-- NeoGit
map("n", "<leader>fg","<cmd> Neogit <CR>")

-- LSP
map("n", "<leader>rn","<cmd> lua vim.lsp.buf.rename() <CR>")
map("n", "<leader>n","<cmd> lua vim.diagnostic.open_float() <CR>")

-- NeoCodeium
map("n", "<leader>b","<cmd> NeoCodeium toggle<CR>")

-- spectre
vim.keymap.set('n', '<leader>s', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
