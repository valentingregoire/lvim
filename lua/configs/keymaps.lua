-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { noremap = true, silent = true }

-- generates options for keymaps
local function getOptions(desc)
    return {
        noremap = true,
        silent = true,
        desc = desc,
    }
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- leader
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", getOptions("פּ  Toggle explorer"))
keymap("n", "<Leader>n", "<cmd>noh<CR>", getOptions("  Remove search highlights"))
keymap("", "<Leader>h", "<cmd>Alpha<CR>", getOptions("  Home"))
-- keymap("", "<Leader>m", "<cmd>Notifications<CR>", getOptions("  Notifications"))

-- leader leader (vim stuff)
keymap("n", "<Leader><Leader>x", ":source %<CR>", getOptions("勒 Reload configs"))

-- default editor
keymap("n", "<c-s>", ":w<CR>", getOptions("  Save"))
keymap("i", "<c-s>", "<ESC>:w<CR>a", getOptions("  Save"))
keymap("n", '<leader>"', 'ciw""<Esc>P', getOptions("  Double quotes"))
keymap("n", "<leader>'", "ciw''<Esc>P", getOptions("  Single quotes"))

-- window management
keymap("n", "<c-h>", "<c-w>h", getOptions("  Window left"))
keymap("n", "<c-j>", "<c-w>j", getOptions("  Window down"))
keymap("n", "<c-k>", "<c-w>k", getOptions("  Window up"))
keymap("n", "<c-l>", "<c-w>l", getOptions("  Window right"))
-- resize
keymap("n", "<c-Up>", ":resize -2<CR>", getOptions("ﲗ  Vertical smaller"))
keymap("n", "<c-Down>", ":resize +2<CR>", getOptions("ﲔ  Vertical larger"))
keymap("n", "<c-Left>", ":vertical resize -2<CR>", getOptions("ﲕ  Horizontal smaller"))
keymap("n", "<c-Right>", ":vertical resize +2<CR>", getOptions("ﲖ  Horizontal larger"))

-- move text up and down
keymap("v", "<A-j>", "<cmd>m .+1<CR>==gv", getOptions("  Move lines down"))
keymap("v", "<A-k>", "<cmd>m .-2<CR>==gv", getOptions("  Move lines up"))
keymap("n", "<A-j>", "<cmd>m .+1<CR>==", getOptions("  Move lines down"))
keymap("n", "<A-k>", "<cmd>m .-2<CR>==", getOptions("  Move lines up"))
keymap("v", ">", ">gv", getOptions("  Increase indentation"))
keymap("v", "<", "<gv", getOptions("  Decrease indentation"))

-- comment
keymap("n", "<C-/>", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))
keymap("v", "<C-/>", "<cmd>visual gc<CR>", getOptions("  Comment line style"))
keymap("n", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))
keymap("v", "<leader>/", "<cmd>norm gcc<CR>", getOptions("  Comment line style"))

-- Buffers
keymap("", "<S-E>", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<S-R>", "<cmd>bn<CR>", getOptions("  Next buffer"))
keymap("", "<Leader>bcc", "<cmd>bw<CR>", getOptions("  Close buffer"))
keymap("", "<Leader>bcC", "<cmd>bw!<CR>", getOptions("  Force close buffer"))
keymap("", "<Leader>bcl", "<cmd>BufferLineCloseLeft<CR>", getOptions("  Close buffers to the left"))
keymap("", "<Leader>bcr", "<cmd>BufferLineCloseRight<CR>", getOptions("  Close buffers to the right"))
keymap("", "<Leader>bp", "<cmd>bp<CR>", getOptions("  Previous buffer"))
keymap("", "<Leader>bn", "<cmd>bn<CR>", getOptions("  Next buffer"))
keymap("", "<Leader>bl", "<cmd>Telescope buffers<CR>", getOptions("  List buffers"))
keymap("", "<Leader>bp", "<cmd>BufferLineTogglePin<CR>", getOptions("車 Toggle pin"))
keymap("", "<S-Tab>", "<cmd>:b#<CR>", getOptions(" Jump to last used buffer"))

-- Session manager
keymap("", "<Leader>sa", "<cmd>SessionManager load_last_session<CR>", getOptions("  Load last session"))
keymap("", "<Leader>ss", "<cmd>SessionManager save_current_session<CR>", getOptions("  Save session"))
keymap("", "<Leader>sl", "<cmd>SessionManager load_session<CR>", getOptions("  Load session"))
keymap("", "<Leader>sd", "<cmd>SessionManager delete_session<CR>", getOptions("  Delete session"))
-- autosession
-- keymap("", "<Leader>sa", "<cmd>RestoreSession<CR>", getOptions("  Load last session")) keymap("", "<Leader>ss", "<cmd>SaveSession<CR>", getOptions("  Save session"))
-- keymap("", "<Leader>sl", "<cmd>Autosession search<CR>", getOptions("  Load session"))
-- keymap("", "<Leader>sd", "<cmd>Autosession delete<CR>", getOptions("  Delete session"))



-- NvimTree
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", getOptions("פּ  Toggle explorer"))

-- Telescope
keymap("n", "<c-p>", "<cmd>Telescope<CR>", getOptions("  Telescope"))
keymap("n", "<leader>f<CR>", ":Telescope<CR>", getOptions("  Telescope"))
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", getOptions("  Live grep"))
keymap("n", "<leader>fp", ":Telescope projects<CR>", getOptions("  Projects"))
keymap("n", "<leader>fb", ":Telescope buffers<CR>", getOptions("裡 Buffers"))
keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", getOptions("  Find file"))
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", getOptions("ﭯ  Open recent file"))
keymap("n", "<leader>fn", "<cmd>new<CR>", getOptions("  New file"))

-- Git
--[[ keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", getOptions("  Git")) ]]
-- keymap("n", "<leader>gg", "<cmd>LazyGit<CR>", getOptions("  Git"))

-- -- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- run code
keymap("n", "<F3>", "<cmd>SnipRun<CR>", getOptions("  Run selection"))
keymap("v", "<F3>", "<cmd>SnipRun<CR>", getOptions("  Run selection"))
keymap("n", "<F4>", "<cmd>Jaq<CR>", getOptions("  Run code"))

-- DAP debugging
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", getOptions("  Toggle breakpoint"))
keymap(
    "n",
    "<leader>dB",
    "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
    getOptions("ﳁ  Toggle conditional breakpoint")
)
keymap(
    "n",
    "<leader>dl",
    "<cmd>lua require'dap'.set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
    getOptions("  Set log point")
)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", getOptions("  Continue"))
keymap("n", "<F8>", "<cmd>lua require'dap'.continue()<cr>", getOptions("  Continue"))
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", getOptions("  Step into"))
keymap("n", "<F5>", "<cmd>lua require'dap'.step_into()<cr>", getOptions("  Step into"))
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", getOptions("  Step over"))
keymap("n", "<F6>", "<cmd>lua require'dap'.step_over()<cr>", getOptions("  Step over"))
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", getOptions("  Step out"))
keymap("n", "<F7>", "<cmd>lua require'dap'.step_out()<cr>", getOptions("  Step out"))
-- keymap("n", "<leader>dm", "<cmd>lua require'dap-python'.test_method()<cr>", getOptions("  Test method"))
keymap("n", "<leader>dm", "<cmd>lua require'neotest'.run.run()<cr>", getOptions("  Test method"))
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", getOptions("  Toggle REPL"))
keymap("n", "<leader>dL", "<cmd>lua require'dap'.run_last()<cr>", getOptions("漏 Run last"))
keymap("n", "<leader>dg", "<cmd>lua require'dapui'.toggle()<cr>", getOptions("拓 Toggle GUI"))
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", getOptions("栗 Stop"))
keymap("n", "<leader>du", "<cmd>lua require('dapui').eval()<CR>", getOptions("  Evaluate expression"))
keymap("v", "<leader>du", "<cmd>lua require('dapui').eval()<CR>", getOptions("  Evaluate expression"))

-- toggle terminal
-- keymap("", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
-- keymap("t", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
-- keymap("i", "<C-t>", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("  Toggle floating terminal"))
keymap("", "<Leader>tf", "<cmd>ToggleTerm direction=float<CR>", getOptions("禎 Toggle floating terminal"))
keymap("", "<Leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", getOptions("ﬠ  Toggle horizontal terminal"))
keymap("", "<Leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", getOptions("ײַ  Toggle vertical terminal"))
-- keymap("t", "<Leader>t", "<cmd>ToggleTerm<CR>", getOptions("  Toggle terminal"))

-- neotest
keymap("", "<Leader>um", "<cmd>lua require'neotest'.run.run()<cr>", getOptions("ﭧ Test method"))
keymap("", "<Leader>ud", "<cmd>lua require'neotest'.run.run({strategy='dap'})<cr>", getOptions(" Debug method"))
keymap("", "<Leader>uc", "<cmd>lua require'neotest'.run.run(vim.fn.expand('%'))<cr>", getOptions("  Test class"))
keymap("", "<Leader>uo", "<cmd>lua require'neotest'.output_panel.toggle()<cr>", getOptions("  Output"))
keymap("", "<Leader>us", "<cmd>lua require'neotest'.summary.toggle()<cr>", getOptions("  Summary"))
keymap("", "<Leader>ug",
    "<cmd>lua require'neotest'.output_panel.toggle()<cr><cmd>lua require'neotest'.summary.toggle()<cr>",
    getOptions("拓 Toggle GUI"))

-- markdown preview
keymap("", "<Leader>p", "<cmd>MarkdownPreviewToggle<CR>", getOptions("  Markdown preview"))

-- Which key
local wk = lvim.builtin.which_key

wk.mappings["m"] = {
    name = "  Bookmarks",
    a = "  Show all bookmarks",
    c = "  Clear bookmark",
    m = "  Toggle bookmark",
    g = "  Move bookmark to line",
    i = "  Annotate bookmark",
    x = "  Clear all bookmarks",
    n = "ﰳ  Next bookmark",
    p = "ﰰ  Previous bookmark",
    j = { name = "ﰭ  Move bookmark down", j = "ﰭ  Move bookmark down" },
    k = { name = "ﰶ  Move bookmark up", j = "ﰭ  Move bookmark up" },
}
wk.mappings["b"] = { name = "裡 Buffers", prefix = "<leader>" }
wk.mappings["bc"] = { name = "  Close buffer", prefix = "<leader>" }
wk.mappings["d"] = { name = "ﴫ  Debug", prefix = "<leader>" }
wk.mappings["f"] = { name = "  Telescope", prefix = "<leader>" }
wk.mappings["g"] = { name = "  Git", prefix = "<leader>" }
wk.mappings["l"].name = "  LSP"
-- wk.mappings["l"] = { name = "  LSP", prefix = "<leader>" }
wk.mappings["s"] = { name = "  Sessions", prefix = "<leader>" }
wk.mappings["t"] = { name = "  Terminal", prefix = "<leader>" }
wk.mappings["u"] = { name = "  Unit tests", prefix = "<leader>" }

-- for _, v in ipairs(mappings) do
--     table.insert(wk.mappings, v)
-- end
