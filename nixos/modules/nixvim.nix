{ pkgs, ... }:
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
      spelllang = "en_us"; # Set spellchecking language to English US
      wrap = false; # Prevent text from wrapping hsdf 

      tabstop = 2; # Number of spaces a <Tab> in the text stands for (local to buffer)
      shiftwidth = 2; # Number of spaces used for each step of (auto)indent (local to buffer)
      expandtab = true; # Expand <Tab> to spaces in Insert mode (local to buffer)
      autoindent = true; # Do clever autoindenting

      textwidth = 0; # Maximum width of text that is being inserted.  A longer line will be

      foldlevel = 99; # Folds with a level higher than this number will be closed

      completeopt = ["menu" "menuone" "noselect"]; # For CMP plugin
    };

    globals.mapleader = " "; # Remap <leader> to space
    keymaps = [
      # Global
      # Default mode is "" which means normal-visual-op
      {
        key = "<C-n>";
        action = "<CMD>NvimTreeToggle<CR>";
        options.desc = "Toggle NvimTree";
      }
      {
        key = "<leader>c";
        action = "+context";
      }

      # Buffers
      {
        mode = "n";
        key="<Tab>";
        action="<CMD>bnext<CR>";
        options.desc = "Next buffer";
      }
      {
        mode = "n";
        key="<S-Tab>";
        action="<CMD>bprev<CR>";
        options.desc = "Prev buffer";
      }
       
      # Tabs
      {
        mode = "n";
        key = "<leader>t";
        action = "+tab";
      }
      {
        mode = "n";
        key = "<leader>tn";
        action = "<CMD>tabnew<CR>";
        options.desc = "Create new tab";
      }
      {
        mode = "n";
        key = "<leader>td";
        action = "<CMD>tabclose<CR>";
        options.desc = "Close tab";
      }
      {
        mode = "n";
        key = "<leader>ts";
        action = "<CMD>tabnext<CR>";
        options.desc = "Go to the sub-sequent tab";
      }
      {
        mode = "n";
        key = "<leader>tp";
        action = "<CMD>tabprevious<CR>";
        options.desc = "Go to the previous tab";
      }

      # Terminal
      {
        # Escape terminal mode using ESC
        mode = "t";
        key = "<esc>";
        action = "<C-\\><C-n>";
        options.desc = "Escape terminal mode";
      }
    ];
  };

  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      # nix language analyzer
      nixd.enable = true;

      # javascript / typescript
      tsserver.enable = true;
      eslint.enable = true;

      # lua
      lua-ls.enable = true;

      # rust
      rust-analyzer.enable = true;
      rust-analyzer.installRustc = true;
      rust-analyzer.installCargo = true;

      # ruby
      ruby-lsp.enable = true;
      ruby-lsp.cmd = ["${pkgs.rubyPackages_3_3.ruby-lsp}/bin/ruby-lsp"];

      # python
      pyright.enable = true;

      # html
      htmx.enable = true;
      htmx.filetypes = ["html" "erb" "haml"];
      cssls.enable = true;

      # tailwindcss
      tailwindcss.enable = true;
      tailwindcss.filetypes = ["html" "erb" "haml"];

      # json
      jsonls.enable = true;
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

    keymaps.toggle = "<C-/>";
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
      "<leader>fg" = "live_grep";
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

  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      clojure = [
        "clj-kondo"
      ];
      javascript = [
        "eslint"
      ];
      python = [
        "pylint"
      ];
      dockerfile = [
        "hadolint"
      ];
      inko = [
        "inko"
      ];
      janet = [
        "janet"
      ];
      json = [
        "jsonlint"
      ];
      markdown = [
        "vale"
      ];
      rst = [
        "vale"
      ];
      erb = [
        "erb-lint"
      ];
      haml = [
        "haml-lint"
      ];
      terraform = [
        "tflint"
      ];
      text = [
        "vale"
      ];
    };
  };

  programs.nixvim.plugins.cmp = {
    enable = true;
    settings = {
      autoEnableSources = true;
      experimental = { ghost_text = true; };
      performance = {
        debounce = 60;
        fetchingTimeout = 200;
        maxViewEntries = 30;
      };
      snippet = { expand = "luasnip"; };
      formatting = { fields = [ "kind" "abbr" "menu" ]; };
      sources = [
        { name = "nvim_lsp"; }
        { name = "emoji"; }
        {
          name = "buffer"; # text within current buffer
          option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
          keywordLength = 3;
        }
        # { name = "copilot"; } # enable/disable copilot
        {
          name = "path"; # file system paths
          keywordLength = 3;
        }
        {
          name = "luasnip"; # snippets
          keywordLength = 3;
        }
      ];

      window = {
        completion = { border = "solid"; };
        documentation = { border = "solid"; };
      };

      mapping = {
        "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-j>" = "cmp.mapping.select_next_item()";
        "<C-k>" = "cmp.mapping.select_prev_item()";
        "<C-e>" = "cmp.mapping.abort()";
        "<C-b>" = "cmp.mapping.scroll_docs(-4)";
        "<C-f>" = "cmp.mapping.scroll_docs(4)";
        "<C-Space>" = "cmp.mapping.complete()";
        "<CR>" = "cmp.mapping.confirm({ select = true })";
        "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
      };
    };
  };

  programs.nixvim.plugins.lspkind = {
    enable = true;
    symbolMap = {
      Copilot = "";
    };
    extraOptions = {
      maxwidth = 50;
      ellipsis_char = "...";
    };
  };

  programs.nixvim.plugins.cmp-nvim-lsp = {
    enable = true; # LSP
  };
  programs.nixvim.plugins.cmp-buffer = {
    enable = true;
  };
  programs.nixvim.plugins.cmp-path = {
    enable = true; # file system paths
  };
  programs.nixvim.plugins.cmp_luasnip = {
    enable = true; # snippets
  };
  programs.nixvim.plugins.cmp-cmdline = {
    enable = true; # autocomplete for cmdline
  }; 

  programs.nixvim.plugins.vim-css-color = {
    enable = true;
  };

  programs.nixvim.plugins.treesitter.enable = true;
  programs.nixvim.plugins.nvim-tree.enable = true;
  programs.nixvim.plugins.surround.enable = true;
  programs.nixvim.plugins.nix.enable = true;
  programs.nixvim.plugins.oil.enable = true;
  programs.nixvim.plugins.zen-mode.enable = true;
  programs.nixvim.plugins.fzf-lua.enable = true;
  programs.nixvim.plugins.cmp-spell.enable = true;
}

