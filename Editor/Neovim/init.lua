-- ===== Basic options ====

vim.opt.number = true -- Show line number

vim.opt.tabstop = 4 -- Set tab as 4 spaces

vim.opt.shiftwidth = 4 -- Indent with 4 spaces when using >> or auto-indent

vim.opt.expandtab = true -- Insert spaces instead of a real tab character

vim.opt.smartindent = true -- Indent automatically

vim.opt.autoindent = true -- Keep the indentation of the previous line on a new line

vim.opt.termguicolors = true -- Use full 24-bit colors

vim.opt.mouse = "a" -- Enable the mouse in all modes

vim.opt.hidden = true -- Allow swiching between buffers without saving them first

vim.opt.ignorecase = true -- Search is not case sensitive

vim.opt.smartcase = true -- Search is case sensitive if there is a capital letter

vim.opt.showtabline = 0 -- Never Shows the bar at the top

vim.opt.cursorline = true -- Highlight the line where the cursor is

vim.opt.path:append("**") -- Let :find search in all subfolder

vim.opt.wildmenu = true -- Show a menu when completing commands with TAB

vim.opt.syntax = "on" -- Turn on syntax highlighting

-- ===== Plugins =====

vim.pack.add({
  "https://github.com/ellisonleao/gruvbox.nvim",
  "https://github.com/vim-airline/vim-airline",
  "https://github.com/vim-airline/vim-airline-themes",
  "https://github.com/tpope/vim-fugitive",
})


-- ===== Gruvbox =====

require("gruvbox").setup({
  contrast = "hard",
})

vim.o.background = "dark"

vim.cmd.colorscheme("gruvbox")

vim.g.airline_theme = "base16_gruvbox_dark_hard"

-- ===== Fugitive =====

-- Small helper to make mappings shorter
local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>gs", ":Git<CR>")          -- Git status window
map("n", "<leader>gc", ":Git commit<CR>")   -- Commit
map("n", "<leader>gp", ":Git push<CR>")     -- Push
map("n", "<leader>gl", ":Git log<CR>")      -- Log
map("n", "<leader>gd", ":Gdiffsplit<CR>")   -- Diff of the current file
map("n", "<leader>gb", ":Git blame<CR>")    -- Blame

