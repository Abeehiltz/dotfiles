-- Hint: use `:h <option>` to figure out the meaning if needed
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.encoding = "UTF-8"

-- Tab
vim.opt.tabstop = 4      -- number of visual spaces per TAB
vim.opt.softtabstop = 4  -- number of spacesin tab when editing
vim.opt.shiftwidth = 4   -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
vim.opt.autoindent = true

-- UI config
-- - Relative and absolute line numbers combined
vim.opt.number = true         -- show absolute number
vim.opt.relativenumber = true -- add numbers to each line on the left side

-- - Cursorline
vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally

-- - Window splitting
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right

-- - Enable termguicolors
vim.opt.termguicolors = true -- enabl 24-bit RGB color in the TUI

-- Searching
vim.opt.incsearch = true  -- search as characters are entered
vim.opt.hlsearch = false  -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true  -- but make it case sensitive if an uppercase is entered

vim.opt.inccommand =
"split"                -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
vim.opt.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.

-- show rounded border popup
vim.opt.winborder = 'rounded'

