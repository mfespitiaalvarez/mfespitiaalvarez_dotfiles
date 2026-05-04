# dotfiles

My tmux + Neovim configs, laid out for [GNU stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a "stow package" that mirrors `$HOME`:

```
dotfiles/
  tmux/
    .tmux.conf                  -> ~/.tmux.conf
  nvim/
    .config/nvim/               -> ~/.config/nvim/
```

## Install on a new machine

```bash
# 1. Prereqs (Debian/Ubuntu/gLinux)
sudo apt install -y stow tmux neovim git xclip

# 2. Clone
git clone <this-repo-url> ~/tmux-nvim-crashcourse
cd ~/tmux-nvim-crashcourse/dotfiles

# 3. Symlink
stow tmux
stow nvim
```

`stow tmux` creates `~/.tmux.conf` as a symlink into the repo. Same for nvim — `~/.config/nvim/` ends up pointing at the repo copy.

If a real file is already in the way, stow refuses and tells you which one. Move or delete it, then re-run.

## Switching over an existing machine

The first time you adopt this on a machine that already has `~/.tmux.conf` or `~/.config/nvim/`:

```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.config/nvim ~/.config/nvim.bak
cd ~/tmux-nvim-crashcourse/dotfiles
stow tmux nvim
```

Verify with `ls -l ~/.tmux.conf` — should show `-> .../dotfiles/tmux/.tmux.conf`.

## Day-to-day

Edits to files in `dotfiles/` are live — the symlink means tmux/nvim see changes instantly. `git diff` reflects reality.

To uninstall on a machine: `stow -D tmux nvim` removes the symlinks (originals stay in the repo).

## Adding a new tool

1. Create `dotfiles/<tool>/` mirroring its location under `$HOME`.
2. Move the config in.
3. `stow <tool>`.
