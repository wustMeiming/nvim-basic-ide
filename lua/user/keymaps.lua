-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

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

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Plugins --

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>sw", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<leader>sk", ":Telescope keymaps<CR>", opts)

-- Git
keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- DAP
if meinvim.use_dap then
	keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
	keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
	keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
	keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
	keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
	keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
	keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
	keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
	keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
end

-- Lsp
keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)

-- terminal
keymap("n", "<F7>", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<F7>", "<cmd>ToggleTerm<cr>", opts)
keymap("n", "<leader>tb", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", opts)
keymap("n", "<leader>tf", "<cmd>ToggleTerm<cr>", opts)

-- custom
if meinvim.use_custom_keymap then
	keymap("n", "<leader>w", ":w<cr>", opts)
	keymap("n", "<leader>q", ":q<cr>", opts)
	keymap("n", "<leader>c", "<cmd>Bdelete!<CR>", opts)
end
