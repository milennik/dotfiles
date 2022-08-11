-----------------------------------------------------------
-- Indent line configuration file
-----------------------------------------------------------

-- Plugin: indent-blankline
-- url: https://github.com/lukas-reineke/indent-blankline.nvim


local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

indent_blankline.setup {
  -- char = "▏",
  -- char = ".",
  -- space_char_blankline = " ",
  use_treesitter = true,
  -- show_first_indent_level = true,
  -- show_end_of_line = true,
  -- show_current_context = true,
  -- show_current_context_start = true,
  filetype_exclude = {
    'help',
    'dashboard',
    'git',
    'markdown',
    'text',
    'terminal',
    'lspinfo',
    'packer',
    'NvimTree',
  },
  buftype_exclude = {
    'terminal',
    'nofile',
  },
}
