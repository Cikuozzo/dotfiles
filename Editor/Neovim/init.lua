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
vim.opt.clipboard = "unnamedplus" -- Use the system clipboard for all yank, delete and paste
vim.opt.showmode = false -- The mode is already shown by lualine
vim.opt.shortmess:append("I") -- Hide the intro screen

-- Deleting does not overwrite the clipboard

vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "d", '"_d')

-- ===== Plugins =====

vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons", -- icons (needs a Nerd Font)
    "https://github.com/tpope/vim-fugitive",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/hrsh7th/cmp-buffer",        -- words from the buffer
    "https://github.com/hrsh7th/cmp-path",          -- file paths
    "https://github.com/hrsh7th/cmp-nvim-lsp",      -- sources from LSP servers
    "https://github.com/L3MON4D3/LuaSnip",          -- snippet engine
    "https://github.com/saadparwaiz1/cmp_luasnip",  -- snippet source for cmp
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})


-- ===== Gruvbox =====

require("gruvbox").setup({
    contrast = "hard",
})

vim.o.background = "dark"

vim.cmd.colorscheme("gruvbox")

-- ===== Lualine =====

require("lualine").setup({
    options = {
        theme = "auto",
        section_separators = "",
        component_separators = "|",
    },
})


-- ===== Fugitive =====

local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { silent = true })
end

map("n", "<leader>gs", ":Git<CR>")          -- Git status window
map("n", "<leader>gc", ":Git commit<CR>")   -- Commit
map("n", "<leader>gp", ":Git push<CR>")     -- Push
map("n", "<leader>gl", ":Git log<CR>")      -- Log
map("n", "<leader>gd", ":Gdiffsplit<CR>")   -- Diff of the current file
map("n", "<leader>gb", ":Git blame<CR>")    -- Blame

-- ===== Autocompletion (nvim-cmp) =====

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping.select_next_item(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})


-- ===== File explorer (netrw) =====

vim.g.netrw_banner = 0        -- Hide the top help banner
vim.g.netrw_liststyle = 3     -- Tree view
vim.g.netrw_winsize = 25      -- Sidebar width in percent

vim.keymap.set("n", "<leader>ff", ":Lexplore<CR>", { silent = true })


-- ===== Treesitter =====
 
vim.api.nvim_create_autocmd("FileType", {
    callback = function(args)
        -- pcall: filetypes without a parser just keep the classic syntax
        if pcall(vim.treesitter.start, args.buf) then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.wo.foldmethod = "expr"
            vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
            vim.wo.foldlevel = 99 -- Start with all folds open
        end
    end,
})
