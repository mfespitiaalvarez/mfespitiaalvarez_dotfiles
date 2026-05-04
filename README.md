# dotfiles

My tmux + Neovim configs, laid out for [GNU stow](https://www.gnu.org/software/stow/).

## Layout

Each top-level directory is a "stow package" that mirrors `$HOME`:

```
.
├── tmux/
│   └── .tmux.conf          -> ~/.tmux.conf
└── nvim/
    └── .config/nvim/       -> ~/.config/nvim/
```

## Required packages (Debian / Ubuntu / gLinux)

```bash
sudo apt update && sudo apt install -y \
  git stow \
  tmux neovim \
  xclip \
  curl unzip \
  build-essential \
  nodejs npm \
  ripgrep fd-find
```

Why each:

| Package           | Used for                                                                   |
| ----------------- | -------------------------------------------------------------------------- |
| `git`             | clone / pull this repo                                                     |
| `stow`            | symlink the dotfiles into `$HOME`                                          |
| `tmux`            | the multiplexer itself                                                     |
| `neovim` (≥0.10)  | the editor                                                                 |
| `xclip`           | tmux `Y` binding → system clipboard on native Linux (e.g. CloudTop)        |
| `curl`, `unzip`   | Mason downloads LSP servers as zip/tarball                                 |
| `build-essential` | `gcc` + `make` for nvim-treesitter parser compilation                      |
| `nodejs`, `npm`   | Mason installs `pyright` and `marksman` via npm                            |
| `ripgrep`         | telescope `<leader>pg` (`live_grep`) requires it                           |
| `fd-find`         | telescope `<leader>pf` (`find_files`) — faster, respects `.gitignore`      |

> On Debian/Ubuntu `fd` installs as `fdfind`. Optional: `mkdir -p ~/.local/bin && ln -s $(which fdfind) ~/.local/bin/fd` so it's available as `fd`.

If `apt`'s `neovim` is older than 0.10, grab the AppImage or PPA — Mason and treesitter need it.

## Install on a new machine

```bash
# 1. Install prereqs (see above)

# 2. Clone (pick any path; example uses $HOME)
git clone <repo-url> ~/dotfiles
cd ~/dotfiles

# 3. Symlink
stow tmux
stow nvim
```

`stow tmux` creates `~/.tmux.conf` as a symlink into the repo. Same for nvim — `~/.config/nvim/` ends up pointing here.

If a real file is already in the way, stow refuses and tells you which one. Move or delete it, then re-run.

## Switching over a machine that already has configs

```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
mv ~/.config/nvim ~/.config/nvim.bak
cd <this-repo>
stow tmux nvim
```

Verify with `ls -l ~/.tmux.conf` — should show `-> .../tmux/.tmux.conf`.

First nvim launch will bootstrap lazy.nvim and install plugins; first `:Mason` use will install the configured LSP servers (`pyright`, `clangd`, `marksman`).

## Day-to-day

Edits to files in this repo are live — the symlink means tmux/nvim see changes instantly. `git diff` reflects reality.

```bash
# pull updates from another machine
git pull

# push your changes
git add -u && git commit -m "..." && git push
```

To uninstall on a machine: `stow -D tmux nvim` removes the symlinks (originals stay in the repo).

## Adding a new tool

1. Create `<tool>/` mirroring its location under `$HOME`.
2. Move the config in.
3. `stow <tool>`.
