-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>cj", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch Source Header" })

-- dap
map("n", "<leader>dT", "<cmd>lua require('dapui').float_element('stacks', {})<cr>", { noremap = true, silent = true , desc = "Stacks"})
map("n", "<F9>", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", { noremap = true, silent = true , desc = "Toggle Breakpoint"})
map("n", "<F5>", "<cmd>lua require'dap'.continue()<cr>", opts)
map("n", "<F10>", "<cmd>lua require'dap'.step_over()<cr>", opts)
map("n", "<F11>", "<cmd>lua require'dap'.step_into()<cr>", opts)
map("n", "<s-F11>", "<cmd>lua require'dap'.step_out()<cr>", opts)
map("n", "<s-F5>", "<cmd>lua require'dap'.terminate()<cr>", opts)
map("n", "<F6>", "<cmd>lua require'dap'.run_last()<cr>", opts)
