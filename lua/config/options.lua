-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
--
-- vim.opt.background = "light"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
local opts = {
  
  clipboard = "unnamedplus",                                                                       -- allows neovim to access the system clipboard
  
  completeopt = { "menuone", "noselect" },                                                         -- mostly just for cmp
  conceallevel = 0,                                                                                -- so that `` is visible in markdown files
  fileencoding = "utf-8",                                                                          -- the encoding written to a file
  hlsearch = true,                                                                                 -- highlight all matches on previous search pattern
  ignorecase = true,                                                                               -- ignore case in search patterns
  mouse = "a",                                                                                     -- allow the mouse to be used in neovim
  pumheight = 10,                                                                                  -- pop up menu height
  showmode = false,                                                                                -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                                                                                 -- always show tabs
  smartcase = true,                                                                                -- smart case
  smartindent = true,                                                                              -- make indenting smarter again
  splitbelow = true,                                                                               -- force all horizontal splits to go below current window
  splitright = true,                                                                               -- force all vertical splits to go to the right of current window
  swapfile = false,                                                                                -- creates a swapfile
  termguicolors = true,                                                                            -- set term gui colors (most terminals support this)
  timeoutlen = 500,                                                                                -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                                                                                 -- enable persistent undo
  updatetime = 300,                                                                                -- faster completion (4000ms default)
  writebackup = false,                                                                             -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                                                                                -- convert tabs to spaces
  shiftwidth = 2,                                                                                  -- the number of spaces inserted for each indentation
  tabstop = 2,                                                                                     -- insert 2 spaces for a tab
  cursorline = true,                                                                               -- highlight the current line
  cursorcolumn = false,                                                                            -- cursor column.
  number = true,                                                                                   -- set numbered lines
  relativenumber = false,                                                                          -- set relative numbered lines
  numberwidth = 2,                                                                                 -- set number column width to 2 {default 4}
  signcolumn = "yes",                                                                              -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                                                                                    -- display lines as one long line
  scrolloff = 8,                                                                                   -- keep 8 height offset from above and bottom
  sidescrolloff = 8,                                                                               -- keep 8 width offset from left and right
  foldmethod = "expr",                                                                             -- fold with nvim_treesitter
  foldexpr = "v:lua.vim.treesitter.foldexpr()",
  foldenable = false,                                                                              -- no fold to be applied when open a file
  foldlevel = 99,                                                                                  -- if not set this, fold will be everywhere
  spell = false,                                                                                   -- add spell support
  spelllang = { 'en_us' },                                                                         -- support which languages?
  diffopt = "vertical,filler,internal,context:4",                                                  -- vertical diff split view
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions" -- session
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end

local function set_ime(args)
  if args.event:match("Enter$") then
    vim.g.neovide_input_ime = true
  else
    vim.g.neovide_input_ime = false
  end
end

local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
  group = ime_input,
  pattern = "*",
  callback = set_ime,
})

vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
  group = ime_input,
  pattern = "[/\\?]",
  callback = set_ime,
})

--vim.g.neovide_cursor_vfx_mode = "railgun"

local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
  group = group_cdpwd,
  pattern = "*",
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
  end,
})
