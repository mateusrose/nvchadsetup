return {
  "greggh/claude-code.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim", -- Required for git operations
  },
  config = function()
    require("claude-code").setup({
      -- Terminal window settings
      window = {
        split_ratio = 0.4,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
        position = "float",  -- Position of the window: "botright", "topleft", "vertical", "float", etc.
        enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
        hide_numbers = true,    -- Hide line numbers in the terminal window
        hide_signcolumn = true, -- Hide the sign column in the terminal window
        -- Floating window configuration (only applies when position = "float")
        float = {
          width = "40%",        -- Width: number of columns or percentage string
          height = "90%",       -- Height: number of rows or percentage string
          row = "5%",       -- Row position: number, "center", or percentage string
          col = "80%",       -- Column position: number, "center", or percentage string
          relative = "editor",  -- Relative to: "editor" or "cursor"
          border = "rounded",   -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
        },
      },
      -- File refresh settings
      refresh = {
        enable = true,           -- Enable file change detection
        updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
        timer_interval = 1000,   -- How often to check for file changes (milliseconds)
        show_notifications = true, -- Show notification when files are reloaded
      },
      -- Git project settings
      git = {
        use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
      },
      -- Shell-specific settings
      shell = {
        separator = '&&',        -- Command separator used in shell commands
        pushd_cmd = 'pushd',     -- Command to push directory onto stack (e.g., 'pushd' for bash/zsh, 'enter' for nushell)
        popd_cmd = 'popd',       -- Command to pop directory from stack (e.g., 'popd' for bash/zsh, 'exit' for nushell)
      },
      -- Command settings
      command = "claude",        -- Command used to launch Claude Code
      -- Command variants
      command_variants = {
        -- Conversation management
        continue = "--continue", -- Resume the most recent conversation
        resume = "--resume",     -- Display an interactive conversation picker
        verbose = "--verbose",   -- Enable verbose logging with full turn-by-turn output
      },
      -- Keymaps
      keymaps = {
        toggle = {
          normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
          terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
          variants = {
            continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
            verbose = "<leader>cV",  -- Normal mode keymap for Claude Code with verbose flag
          },
        },
        window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
        scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
      }
    })
    vim.keymap.set('n', '<leader>cc', function()
      require('claude-code').toggle()
    end, { desc = 'Toggle Claude Code' })

    -- Helper: get the Claude Code terminal channel
    local function get_claude_chan()
      local cc = require('claude-code')
      local instance = cc.claude_code.current_instance
      if not instance then return nil end
      local bufnr = cc.claude_code.instances[instance]
      if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then return nil end
      return vim.b[bufnr].terminal_job_id
    end

    -- Helper: send text to Claude Code terminal, opening it first if needed
    local function send_to_claude(text)
      local chan = get_claude_chan()
      if not chan then
        require('claude-code').toggle()
        vim.schedule(function()
          chan = get_claude_chan()
          if chan then
            vim.api.nvim_chan_send(chan, text)
          end
        end)
      else
        -- Make sure the window is visible
        local cc = require('claude-code')
        local bufnr = cc.claude_code.instances[cc.claude_code.current_instance]
        if bufnr and #vim.fn.win_findbuf(bufnr) == 0 then
          cc.toggle()
        end
        vim.api.nvim_chan_send(chan, text)
      end
    end

    -- Send current file:line reference to Claude
    vim.keymap.set('n', '<leader>cl', function()
      local file = vim.fn.expand('%:.')  -- relative path
      local line = vim.fn.line('.')
      send_to_claude(file .. ':' .. line .. ' ')
    end, { desc = 'Send file:line to Claude' })

    -- Send visual selection file:range reference to Claude (no content, saves tokens)
    vim.keymap.set('v', '<leader>cs', function()
      local file = vim.fn.expand('%:.')
      local start_line = vim.fn.line("'<")
      local end_line = vim.fn.line("'>")
      send_to_claude(file .. ':' .. start_line .. '-' .. end_line .. ' ')
    end, { desc = 'Send file:range to Claude' })

    -- Send current file path to Claude
    vim.keymap.set('n', '<leader>cf', function()
      local file = vim.fn.expand('%:.')
      send_to_claude(file .. ' ')
    end, { desc = 'Send file path to Claude' })

    -- Focus the Claude Code window (open it if not visible)
    vim.keymap.set('n', '<leader>cx', function()
      local cc = require('claude-code')
      local instance = cc.claude_code.current_instance
      if not instance then
        cc.toggle()
        return
      end
      local bufnr = cc.claude_code.instances[instance]
      if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
        cc.toggle()
        return
      end
      local wins = vim.fn.win_findbuf(bufnr)
      if #wins == 0 then
        cc.toggle()
      else
        vim.api.nvim_set_current_win(wins[1])
      end
    end, { desc = 'Focus Claude Code window' })

    -- Move the Claude Code floating window with <C-S-h/j/k/l> in terminal mode
    local move_step = 5
    local function move_float(dr, dc)
      local win = vim.api.nvim_get_current_win()
      local cfg = vim.api.nvim_win_get_config(win)
      if cfg.relative == "" then return end
      cfg.row = (cfg.row or 0) + dr
      cfg.col = (cfg.col or 0) + dc
      vim.api.nvim_win_set_config(win, cfg)
    end

    vim.keymap.set('t', '<S-Left>', function() move_float(0, -move_step) end, { desc = 'Move float left' })
    vim.keymap.set('t', '<S-Right>', function() move_float(0, move_step) end, { desc = 'Move float right' })
    vim.keymap.set('t', '<S-Up>', function() move_float(-move_step, 0) end, { desc = 'Move float up' })
    vim.keymap.set('t', '<S-Down>', function() move_float(move_step, 0) end, { desc = 'Move float down' })

    -- Resize the Claude Code floating window with <C-S-arrows> in terminal mode
    -- Right/Up = bigger, Left/Down = smaller
    local resize_step = 3
    local function resize_float(dw, dh)
      local win = vim.api.nvim_get_current_win()
      local cfg = vim.api.nvim_win_get_config(win)
      if cfg.relative == "" then return end
      cfg.width = math.max(10, (cfg.width or 40) + dw)
      cfg.height = math.max(5, (cfg.height or 20) + dh)
      vim.api.nvim_win_set_config(win, cfg)
    end

    vim.keymap.set('t', '<C-Right>', function() resize_float(resize_step, 0) end, { desc = 'Widen float' })
    vim.keymap.set('t', '<C-Left>', function() resize_float(-resize_step, 0) end, { desc = 'Narrow float' })
    vim.keymap.set('t', '<C-Up>', function() resize_float(0, resize_step) end, { desc = 'Grow float taller' })
    vim.keymap.set('t', '<C-Down>', function() resize_float(0, -resize_step) end, { desc = 'Shrink float shorter' })
  end
}
