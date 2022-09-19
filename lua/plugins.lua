-- Plugin definition and loading
-- local execute = vim.api.nvim_command
local fn = vim.fn
local cmd = vim.cmd


-- Boostrap Packer
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
local packer_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
end



-- Load Packer
cmd([[packadd packer.nvim]])



-- Rerun PackerCompile everytime pluggins.lua is updated
cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])



-- Initialize pluggins
return require('packer').startup(function(use)
  -- Let Packer manage itself
  use({'wbthomason/packer.nvim', opt = true})



  -- LSP server
  use({
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  })
  use 'williamboman/nvim-lsp-installer'  -- Helper for installing most language servers



  -- Autocomplete
  use({
    "hrsh7th/nvim-cmp",
    -- Sources for nvim-cmp
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function() require('plugins.cmp') end,
  })



  -- Treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function() require('plugins.treesitter') end,
    run = ':TSUpdate'
  })



  -- Snippets
  use {"L3MON4D3/LuaSnip", config = function() require('plugins.snippets') end}
  use "rafamadriz/friendly-snippets"



  -- Signature help
  use "ray-x/lsp_signature.nvim"



  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('plugins.telescope') end,
  })

  use({'nvim-telescope/telescope-fzf-native.nvim', run ='make'})



  -- bufferline
  -- use {'akinsho/bufferline.nvim', tag = "v2.*",
  -- requires = 'kyazdani42/nvim-web-devicons'}
  -- require("bufferline").setup{}
  use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
  }



  -- statusline
  use({
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end,
  })



  -- NvimTree
  use({
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('plugins.nvimtree') end,  -- Must add this manually
  })



  -- Startify
  use({
    'mhinz/vim-startify',
    config = function()
      local path = vim.fn.stdpath('config')..'/lua/plugins/startify.vim'
      vim.cmd('source '..path)
    end
  })



  -- git commands
  use 'tpope/vim-fugitive'



  -- Gitsigns
  use ({
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function() require('plugins.gitsigns') end
  })



  -- Formatting
  use 'tpope/vim-commentary'
  use 'tpope/vim-unimpaired'
  use "mhartington/formatter.nvim"



  -- Python formatting
  use "EgZvor/vim-black"
  use 'jeetsukumaran/vim-python-indent-black'

  -- Python
  -- use  'heavenshell/vim-pydocstring'   -- Overwrites a keymap, need to fix.
  -- use 'bfredl/nvim-ipy'



  -- TOML Files
  use 'cespare/vim-toml'



  -- For Auto Pairs
  use "steelsojka/pears.nvim"
  -- Setup Pears
    require "pears".setup(
    function(conf)
        conf.remove_pair_on_inner_backspace(true)
        conf.remove_pair_on_outer_backspace(false)
    end
  )



  -- Toggle Term
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup({
    size = 30,
    open_mapping = [[<c-\>]],
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = '1',
    start_in_insert = true,
    persist_size = true,
    direction = 'horizontal'
  })
  end}




  -- markdown-preview
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })


  --indent
  use("lukas-reineke/indent-blankline.nvim")
    
    
  -- colorizer
  use 'norcalli/nvim-colorizer.lua'
  require'colorizer'.setup()




  -- Themes
  use 'marko-cerovac/material.nvim'
  use 'ful1e5/onedark.nvim'
  use "daschw/leaf.nvim"
  use "EdenEast/nightfox.nvim"



  if packer_bootstrap then
    require('packer').sync()
  end
end)
