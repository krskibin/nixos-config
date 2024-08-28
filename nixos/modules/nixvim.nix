{
  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    colorschemes.catppuccin.enable = true;
    colorschemes.catppuccin.settings.background.dark = "mocha";
    
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    opts = {
      updatetime = 100; # Faster completion

      number = true; # Display the absolute line number of the current line

      hidden = true; # Keep closed buffer open in the background

      mouse = "a"; # Enable mouse control
      mousemodel = "extend"; # Mouse right-click extends the current selection

      splitbelow = true; # A new window is put below the current one
      splitright = true; # A new window is put right of the current one

      swapfile = false; # Disable the swap file

      modeline = true; # Tags such as 'vim:ft=sh'
      modelines = 100; # Sets the type of modelines

      undofile = true; # Automatically save and restore undo history

      incsearch = true; # Incremental search: show match for partly typed search command

      inccommand = "split"; # Search and replace: preview changes in quickfix list
      ignorecase = true; # When the search query is lower-case, match both lower and upper-case
      smartcase = true; # Override the 'ignorecase' option if the search pattern contains upper

      scrolloff = 12; # Number of screen lines to show around the cursor

      cursorline = false; # Highlight the screen line of the cursor
      cursorcolumn = false; # Highlight the screen column of the cursor
      signcolumn = "yes"; # Whether to show the signcolumn

      laststatus = 3; # When to use a status line for the last window

      fileencoding = "utf-8"; # File-content encoding for the current buffer

      termguicolors = false; # Disables 24-bit RGB color in the |TUI|

      spell = false; # Highlight spelling mistakes (local to window)
      wrap = false; # Prevent text from wrapping

      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting

      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be

      foldlevel = 99; # Folds with a level higher than this number will be closed

      completeopt = ["menu" "menuone" "noselect"]; # For CMP plugin
    };
  };

  programs.nixvim.plugins.lualine = {
    enable = true;
    globalstatus = true;

    # +-------------------------------------------------+
    # | A | B | C                             X | Y | Z |
    # +-------------------------------------------------+

    sections = {
      lualine_a = ["mode"];
      lualine_b = ["branch"];
      lualine_c = ["filename" "diff"];
      lualine_x = [
        "diagnostics"

       # Show active language server
        {
          name.__raw = ''
            function()
                local msg = ""
                local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                local clients = vim.lsp.get_active_clients()
                if next(clients) == nil then
                    return msg
                end
                for _, client in ipairs(clients) do
                    local filetypes = client.config.filetypes
                    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                    end
                end
                return msg
            end
          '';
          icon = " ";
          # color.fg = "#ffffff";
        }
        "encoding"
        "fileformat"
        "filetype"
      ];
    };

    tabline = {
      lualine_a = ["hostname"];
      lualine_c = [""];
      lualine_b = ["buffers"];
      lualine_x = [];
      lualine_y = [];
      lualine_z = ["tabs"];
    };

    winbar = {
      lualine_a = [];
      lualine_b = [];
      lualine_c = [];
      lualine_x = [];
      lualine_y = [];
      lualine_z = [];
    };
  };

  programs.nixvim.plugins.comment = {
    enable = true;

    settings = {
      opleader.line = "gcc";
      toggler.line = "gcc";
    };
  };

  programs.nixvim.plugins.floaterm = {
    enable = true;

    width = 0.8;
    height = 0.8;

    title = "";

    keymaps.toggle = "<C-b>";
  };

  programs.nixvim.plugins.neo-tree = {
    enable = true;
    filesystem.followCurrentFile.enabled = true;
    closeIfLastWindow = true;
  };

  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>b" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>gf" = "git_files";
      "<leader>of" = "oldfiles";
      # "<leader>fg" = "live_grep";
      # "<leader>fd" = "diagnostics";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };

  programs.nixvim.plugins.nix.enable = true;
}


