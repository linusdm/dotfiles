# Dotfiles

## requirements

- [rcm](https://github.com/thoughtbot/rcm)

## usage

```sh
git clone git@github.com:linusdm/dotfiles.git ~/dotfiles-linus

lsrc -d ~/dotfiles-linus -x README.md
rcup -d ~/dotfiles-linus -x README.md
rcdn -d ~/dotfiles-linus -x README.md
```

Options can be omitted if an ~/.rcrc files is configured correctly.

```
DOTFILES_DIRS="~/dotfiles-linus"
EXCLUDES="README.md"
```

## Neovim TODO

- [x] package manager: lazy.nvim
- [ ] status line
- [x] bufferline
- [ ] git gutter + actions (gitsigns?)
- [ ] autocomplete
- [ ] LSP
- [ ] vim-test
- [x] treesitter
- [x] tmux navigation
- [ ] filetree
- [x] telescope / FZF
- [ ] projectionist
- [ ] [vim dispatch](https://github.com/tpope/vim-dispatch)
- [ ] [vim makery](https://github.com/igemnace/vim-makery)
- [x] [vim surround](https://github.com/tpope/vim-surround)
- [ ] do/end text objects
- [ ] better contrast line numbers (tokyonight theme?)
- [ ] comment with 'gcc'
