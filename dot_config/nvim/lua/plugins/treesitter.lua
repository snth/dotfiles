-- See the following issue for custom configs:
--    https://github.com/LazyVim/LazyVim/discussions/165
return {
  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "awk",
        "bash",
        "beancount",
        "clojure",
        "djot",
        "dot",
        "elixir",
        "fortran",
        "fsharp",
        "haskell",
        "helm",
        "html",
        "http",
        "ini",
        "java",
        "javascript",
        "jq",
        "json",
        "jsonnet",
        "julia",
        "just",
        "kusto",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "nginx",
        "nickel",
        "powershell",
        "prolog",
        "prql",
        "python",
        "query",
        "regex",
        "requirements",
        "ruby",
        "ssh_config",
        "tmux",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "ziggy",
        "ziggy_schema",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
}
