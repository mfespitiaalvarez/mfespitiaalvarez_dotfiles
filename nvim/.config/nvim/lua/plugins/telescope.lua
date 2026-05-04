return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = { 
    "nvim-lua/plenary.nvim" 
  },
  config = function()
    local builtin = require('telescope.builtin')
    
    -- Keymaps for Telescope
    -- <leader>pf  = Project Files
    vim.keymap.set('n', '<leader>pf',  builtin.find_files,  {})
    -- <leader>pg  = Project Grep (search for text inside files)
    vim.keymap.set('n', '<leader>pg',  builtin.live_grep,   {})
    -- <leader>pb  = Project Buffers (open buffers)
    vim.keymap.set('n', '<leader>pb',  builtin.buffers,     {})
    -- <leader>ph  = Project Help tags
    vim.keymap.set('n', '<leader>ph',  builtin.help_tags,   {})
    -- <leader>po  = Project Oldfiles (recent files)
    vim.keymap.set('n', '<leader>po',  builtin.oldfiles,    {})
    -- <leader>pd  = Project Diagnostics (LSP errors/warnings across buffers)
    vim.keymap.set('n', '<leader>pd',  builtin.diagnostics, {})
    -- <leader>pgf = Project Git-tracked Files (skips ignored / build artifacts)
    vim.keymap.set('n', '<leader>pgf', builtin.git_files,   {})
  end
}
