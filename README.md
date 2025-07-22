# FT_NVIM

FT_NVIM is a fork from LazyVim with custom configs made to cater for the need of 42 students. In other words, it has stuff that will make your life easier when coding on C and passing on the norminette.

## Requirements

You need the following programs/executables installed in your computer:

- Git
- neovim
- norminette

## Installation

First, make a backup of your current neovim configuration.

```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

After that, clone the repository

`git clone https://github.com/FelBenini/ft_nvim.git ~/.config/nvim`

Setup the necessary configurations and edit the files.

- Go on *~/.config/nvim/lua/plugins/42.lua* and change your Stdheader config.
- Change your shell interpreter on *~/.config/nvim/lua/config/autocmds.lua*.
