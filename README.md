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
- [x] bufferline
- [x] LSP
- [x] treesitter
- [x] tmux navigation
- [x] telescope / FZF
- [x] filetree
- [x] [vim surround](https://github.com/tpope/vim-surround)
- [x] better contrast line numbers (tokyonight theme?)
- [x] git gutter + actions (gitsigns?) / jump to next/prev hunk
- [ ] autocomplete
- [ ] status line
- [ ] vim-test
- [ ] comment with 'gcc'
- [ ] projectionist
- [ ] [vim dispatch](https://github.com/tpope/vim-dispatch)
- [ ] [vim makery](https://github.com/igemnace/vim-makery)
- [ ] do/end text objects
