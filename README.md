# Dotfiles

## requirements

- GNU stow, available on all platforms

## usage

```sh
git clone [git@github.com:linusdm/dotfiles.git]
cd ~/dotfiles

# stow <package>
stow neovim
```

## requirements for neovim

Neovim will start with errors when no plugins are installed yet. Do `:PlugInstall` and restart nvim to fix these errors.

- neovim 0.5.1
- [elixir-ls](https://github.com/elixir-lsp/elixir-ls) (installed at `~/elixir-ls/rel`, see [this reference](neovim/.config/nvim/lua/lsp.lua#L67))
