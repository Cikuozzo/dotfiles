-- ─────────────────────────────────────────────────────────────
--  LAZY.NVIM — automatic bootstrap
-- ─────────────────────────────────────────────────────────────
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ─────────────────────────────────────────────────────────────
-- MISCELLANEOUS
-- ─────────────────────────────────────────────────────────────
vim.opt.number        = true
vim.opt.tabstop       = 4
vim.opt.shiftwidth    = 4
vim.opt.expandtab     = true
vim.opt.smartindent   = true
vim.opt.autoindent    = true
vim.opt.termguicolors = true
vim.opt.mouse         = "a"
vim.opt.hidden        = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.showtabline   = 0
vim.opt.cursorline    = true
vim.opt.path:append("**")
vim.opt.wildmenu      = true
vim.opt.syntax        = "on"

-- ─────────────────────────────────────────────────────────────
--  PLUGIN
-- ─────────────────────────────────────────────────────────────
require("lazy").setup({

  -- Sensible defaults
  { "tpope/vim-sensible" },

  -- Gruvbox
  {
    "morhetz/gruvbox",
    lazy = false,
    priority = 1000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd("colorscheme gruvbox")
    end,
  },

  -- Airline + theme
  {
    "vim-airline/vim-airline",
    dependencies = { "vim-airline/vim-airline-themes" },
    config = function()
      vim.g["airline#extensions#tabline#enabled"]   = 1
      vim.g["airline#extensions#tabline#formatter"] = "default"
      vim.g.airline_theme                           = "gruvbox"
      vim.g.airline_powerline_fonts                 = 1
    end,
  },

  -- Fugitive
  { "tpope/vim-fugitive" },

  -- Autocompletamento (nvim-cmp)
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",       -- parole dal buffer
      "hrsh7th/cmp-path",         -- percorsi dei file
      "hrsh7th/cmp-nvim-lsp",     -- fonti da server LSP
      "L3MON4D3/LuaSnip",         -- engine snippet
      "saadparwaiz1/cmp_luasnip", -- integrazione snippet per cmp
    },
    config = function()
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
    end,
  },

})

-- ─────────────────────────────────────────────────────────────
--  NETRW
-- ─────────────────────────────────────────────────────────────
vim.g.netrw_banner       = 0
vim.g.netrw_altv         = 1
vim.g.netrw_liststyle    = 3
vim.g.netrw_browse_split = 4

-- ─────────────────────────────────────────────────────────────
--  KEYMAPS
-- ─────────────────────────────────────────────────────────────
local map = vim.keymap.set

-- netrw
map("n", "<leader>ff", ":Explore<CR>")

-- Fugitive
map("n", "<leader>gs", ":Git<CR>")
map("n", "<leader>gc", ":Git commit<CR>")
map("n", "<leader>gp", ":Git push<CR>")
map("n", "<leader>gl", ":Git log<CR>")
map("n", "<leader>gd", ":Gdiff<CR>")
map("n", "<leader>gb", ":Git blame<CR>")
