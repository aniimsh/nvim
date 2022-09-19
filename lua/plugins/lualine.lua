-- Lualine configuration

-- local non_language_ft = {'fugitive', 'startify'}

-- require('lualine').setup({
--   options = {
--     theme = "tokyonight",
--     -- Separators might look weird for certain fonts (eg Cascadia)
--     component_separators = {left = '', right = ''},
--     section_separators = {left = '', right = ''},
--     globalstatus = true,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     lualine_b = {'branch', 'diff'},
--     lualine_c = {
--       'filetype',
--       {
--         function()
--           local msg = 'No LSP'
--           local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
--           local clients = vim.lsp.get_active_clients()

--           if next(clients) == nil  then
--             return msg
--           end

--           -- Check for utility buffers
--           for ft in non_language_ft do
--             if ft:match(buf_ft) then
--               return ''
--             end
--           end

--           for _, client in ipairs(clients) do
--             local filetypes = client.config.filetypes

--             if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
--               -- return 'LSP:'..client.name  -- Return LSP name
--               return ''  -- Only display if no LSP is found
--             end
--           end

--           return msg
--         end,
--         color = {fg = '#ffffff', gui = 'bold'},
--         separator = "",
--       },
--       {
--         'diagnostics',
--         sources = {'nvim_diagnostic'},
--         sections = {'error', 'warn', 'info'},
--       },
--     },
--     lualine_x = {'encoding'},
--     lualine_y = {'progress'},
--     lualine_z = {
--       {function () return '' end},
--       {'location'},
--     }
--   },
-- })



require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'leaf',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
