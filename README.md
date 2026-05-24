# dotfiles

Personal config files for macOS development with `zsh`, `tmux`, and `vim`/`neovim`.

## Overview

This repository includes:

- `.zshrc` for shell configuration and plugin loading
- `.tmux.conf` for terminal multiplexer navigation and pane management
- `.vimrc` for Vim/Neovim keybindings, UI settings, and plugin mappings
- Git submodules for Zsh and Vim plugins

## Setup

1. Clone this repository:

```bash
git clone https://github.com/<you>/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

2. Initialize submodules:

```bash
git submodule update --init --recursive
```

3. Create symlinks for your home directory:

```bash
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
```

4. Install required tools if needed:

- `zsh`
- `fzf`
- `neovim` or `vim`
- `zoxide` (optional)
- `chruby` / Ruby (optional if you use Ruby switching)

5. Reload Zsh:

```bash
source ~/.zshrc
```

6. Open Neovim/Vim and make sure plugins are available. The plugin directories are managed as git submodules.

## Git Submodule Plugins

### Zsh plugins

- `.zsh/zsh-autosuggestions` — https://github.com/zsh-users/zsh-autosuggestions
- `.zsh/zsh-syntax-highlighting` — https://github.com/zsh-users/zsh-syntax-highlighting
- `.zsh/zsh-autocomplete` — https://github.com/marlonrichert/zsh-autocomplete
- `.zsh/fast-syntax-highlighting` — https://github.com/zdharma-continuum/fast-syntax-highlighting
- `.zsh/zsh-completions` — https://github.com/zsh-users/zsh-completions
- `.zsh/fzf-tab` — https://github.com/Aloxaf/fzf-tab

### Vim/Neovim plugins

- `.vim/pack/3rd-party/start/vim-gitgutter` — https://github.com/airblade/vim-gitgutter
- `.vim/pack/3rd-party/start/vim-easymotion` — https://github.com/easymotion/vim-easymotion
- `.vim/pack/3rd-party/start/vim-fugitive` — https://github.com/tpope/vim-fugitive
- `.vim/pack/3rd-party/start/vim-surround` — https://github.com/tpope/vim-surround
- `.vim/pack/3rd-party/start/fzf.vim` — https://github.com/junegunn/fzf.vim
- `.vim/pack/3rd-party/start/copilot.vim` — https://github.com/github/copilot.vim

## Keybindings Cheat Sheet

### Tmux

| Action | Keys |
| --- | --- |
| Prefix | `Ctrl-b` |
| Secondary prefix | `Ctrl-s` |
| Split vertical | `|` |
| Split horizontal | `-` |
| Pane navigation | `h`, `j`, `k`, `l` |
| Window navigation | `Ctrl-h`, `Ctrl-l` |
| Resize pane | `H`, `J`, `K`, `L` |
| Sync panes | `a` |
| Enter copy mode | `/` |
| Break pane into new window | `b` |
| Reload config | `R` |

### Zsh

| Feature | Description |
| --- | --- |
| `source <(fzf --zsh)` | Load `fzf` shell integration |
| `zsh-autocomplete` | Smart inline completion |
| `zsh-autosuggestions` | History suggestions while typing |
| `fast-syntax-highlighting` / `zsh-syntax-highlighting` | Typed command highlighting |
| `zsh-completions` | Extended completion definitions |
| `fzf-tab` | Fuzzy completion on `Tab` |

### Vim / Neovim

Leader key: `,`

#### File, search, and buffer navigation

| Action | Keys |
| --- | --- |
| Save file | `,w` |
| Save as sudo | `w!!` |
| Open fuzzy file finder | `,f` (`:Files`) |
| Search with ripgrep | `,g` (`:Rg`) |
| List buffers | `,bb` (`:Buffers`) |
| History | `,h` (`:History`) |
| Close buffer | `,bc` |
| Close all buffers | `,ba` |
| Next buffer | `,bn` |
| Previous buffer | `,bp` |

#### Search and editing

| Action | Keys |
| --- | --- |
| Start search | `space` |
| Reverse search | `Ctrl-space` |
| Clear search highlighting | `, <CR>` |
| Search selected text literally | `*` (visual mode) |
| Toggle fold | `+` |
| Create fold | `zf` (visual mode) |

#### Tabs and window commands

| Action | Keys |
| --- | --- |
| New tab | `,tn` |
| Keep only current tab | `,to` |
| Close tab | `,tc` |
| Move tab | `,tm` |
| Toggle last tab | `,tl` |
| Open tab edit in current directory | `,te` |
| Change current file directory | `,cd` |
| Jump to first non-blank char | `0` |

#### Insert-mode helpers

| Action | Keys |
| --- | --- |
| Quote pair | `"` → `""` |
| Single-quote pair | `'` → `''` |
| Parentheses pair | `(` → `()` |
| Brackets pair | `[` → `[]` |
| Braces pair | `{` → `{}` |
| Open block with newline | `{<CR>` |
| Create brace block with semicolon | `;<CR>` |
| Move cursor in insert mode | `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, `Ctrl-l` |
| Move to end of line | `Ctrl-e` |
| Move to last edit position | `Ctrl-y` |

#### EasyMotion mappings

| Action | Keys |
| --- | --- |
| Jump to any character globally | `,es` |
| Jump to any word globally | `,ew` |
| Jump to a line | `,ej` |
| Advanced 2-character search | `,e/` |

#### Spell and editing helpers

| Action | Keys |
| --- | --- |
| Toggle spell checking | `,ss` |
| Next spelling error | `,sn` |
| Previous spelling error | `,sp` |
| Add word to spell file | `,sa` |
| Suggest correction | `,sr` |

#### Miscellaneous

| Action | Keys |
| --- | --- |
| Run make and refresh quickfix | `,m` |
| Open `~/buffer` | `,q` |
| Open `~/buffer.md` | `,x` |
| Toggle paste mode | `,pp` |

## Notes

- The Zsh config uses `~/.zsh` for plugin directories.
- The Vim config relies on runtime path packages under `.vim/pack/3rd-party/start`.
- `fzf` must be installed for shell and Vim fuzzy search integration.

