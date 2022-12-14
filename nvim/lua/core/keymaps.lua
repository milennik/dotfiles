-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ','

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Disable arrow keys
map('', '<up>', '<nop>')
map('', '<down>', '<nop>')
map('', '<left>', '<nop>')
map('', '<right>', '<nop>')

map('n','<C-x>',':bw<CR>:bn<CR>')
-- Map Esc to kk
map('i', 'kk', '<Esc>')

-- Clear search highlighting with <leader> and c
map('n', '<leader>c', ':nohl<CR>')

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')
vim.opt.pastetoggle = '<F2>'

-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('n', '<C-j>', '<C-w>j')
map('n', '<C-k>', '<C-w>k')
map('n', '<C-l>', '<C-w>l')

-- Reload configuration without restart nvim
map('n', '<leader>r', ':so %<CR>')

-- Fast saving with <leader> and s
-- map('n', '<leader>s', ':w<CR>')
-- map('i', '<leader>s', '<C-c>:w<CR>')

-- Close all windows and exit from Neovim with <leader> and q
-- map('n', '<leader>q', ':qa!<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true })  -- open
map('t', '<Esc>', '<C-\\><C-n>')                    -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>')            -- open/close
-- map('n', '<leader>f', ':NvimTreeRefresh<CR>')       -- refresh
map('n', '<C-`>', ':NvimTreeFindFile<CR>')      -- search file

-- Tagbar
-- map('n', '<leader>z', ':TagbarToggle<CR>')          -- open/close

-- Hop
map('n', '<C-e>', ':HopWord<CR>')          -- open/close

-- Fzf
map('n', '<C-f>', ":lua require('fzf-lua').files()<cr>")          -- Fzf files
map('n', '<C-a>', ":lua require('fzf-lua').grep()<cr>")          -- Fzf grep
map('n', '<C-g>', ":lua require('fzf-lua').grep_cword()<cr>")          -- Fzf grep word

-- Copy file's relative path
map('n', '<C-c>', ":let @* = fnamemodify(expand('%'), ':~:.')<cr>")

-- Git diff
map('n', '<C-y>', ":lua require('gitdiff').diff('master')<cr>")
-- map('n', '<C-[>', ":lua require('gitdiff').diff()<cr>")
map('n', '<C-p>', ":Gvdiffsplit master<cr>")

-- Telescope
map('n', '<C-b>', ":Telescope buffers<cr>")
map('n', 'gr', ":lua require('telescope.builtin').lsp_references()<cr>")
map('n', 'gs', ":lua require('telescope.builtin').lsp_document_symbols()<cr>")
map('n', 'ga', ":lua require('telescope.builtin').diagnostics()<cr>")
map('n', 'gv', ":lua require('telescope.builtin').git_commits()<cr>")
map('n', 'gy', ":lua require('telescope.builtin').git_branches()<cr>")
map('n', 'gt', ":lua require('telescope.builtin').git_status()<cr>")
map('n', 'gh', ":lua require('telescope.builtin').git_stash()<cr>")
