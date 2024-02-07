# dotfiles

Environment configuration for tmux + vim + zsh on macOS & Linux, keeping it simple and easy to expand.

## Installation

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yingca1/dotfiles/master/install.sh)"
```

## How to use

### tmux

- both `<C-a>` and `<C-b>` are the prefix
- mouse scroll initiates tmux scroll
- `prefix v` makes a vertical split
- `prefix s` makes a horizontal split

If you have three or more panes:

- `prefix +` opens up the main-horizontal-layout
- `prefix =` opens up the main-vertical-layout

You can adjust the size of the smaller panes in `tmux.conf` by lowering or increasing the `other-pane-height` and `other-pane-width` options.

### vim

The following assume your leader key is set to `\`.

- `\d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
- `\t` brings up [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a project file filter for easily opening specific files
- `\b` restricts ctrlp.vim to open buffers
- `\a` starts project search with [ag.vim](https://github.com/rking/ag.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher) (like ack, but faster)
- `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
- `gcc` toggles current line comment
- `gc` toggles visual selection comment lines
- `vii`/`vai` visually select _in_ or _around_ the cursor's indent
- `Vp`/`vp` replaces visual selection with default register _without_ yanking selected text (works with any visual selection)
- `\[space]` strips trailing whitespace
- `<C-]>` jump to definition using ctags
- `\l` begins aligning lines on a string, usually used as `\l=` to align assignments
- `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`

#### Plugin Notes

- Plugins managed with Plug, remember to use the command :PlugInstall after opening vim to install plugins
- Plugin installation depends on accessing repositories on GitHub, ensure connectivity to github.com
- Need to add the local id_isa.pub to the SSH keys in the personal settings of GitHub
- For more plugins, visit [https://vimawesome.com/](https://vimawesome.com/)

##### Default Installations

|Plugin|Remarks|
|---|---|
|christoomey/vim-tmux-navigator|Seamless integration with tmux split screens|
|preservim/nerdtree|File navigation sidebar|
|junegunn/fzf.vim|Command-line fuzzy search tool, ripgrep, bat, fd-find, silversearcher-ag, fzf|
|ctrlpvim/ctrlp.vim|Project file retrieval within the project|
|justinmk/vim-sneak|Locate by two characters before and after|
|easymotion/vim-easymotion|Quick navigation within the file by anchor points|
|tpope/vim-surround|Change, delete surrounding characters or tags|
|tpope/vim-dispatch|Tool for asynchronous use. [Video demo](https://vimeo.com/63116209)|
|tpope/vim-unimpaired|Supports many paired operations, such as swapping lines|
|tpope/vim-repeat|Enhances native ' . ' repetition functionality, supports multiple plugins|
|airblade/vim-gitgutter|Displays git status on the left side of the file|
|tpope/vim-fugitive|Common git commands|
|bling/vim-airline|Nice bottom status bar|
|nathanaelkane/vim-indent-guides|Visualizes line indentation|
|godlygeek/tabular|Aligns text, such as tables. [Screen recording demo](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)|
|vim-scripts/Align|Aligns code, for example, when declaring variables|
|tpope/vim-commentary|Comment and uncomment|
|mattn/emmet-vim|Tool for quickly writing xml|

##### Optional Installations

|Plugin|Remarks|
|---|---|
|majutsushi/tagbar|Generates outlines of file content for easy browsing|
|rking/ag.vim|Full-text search within the project|
|[garbas/vim-snipmate](https://github.com/garbas/vim-snipmate)|Manages code snippets|
|tomtom/tlib_vim|Dependency for SnipMate|
|MarcWeber/vim-addon-mw-utils|Dependency for SnipMate|
|pangloss/vim-javascript|Indentation and syntax support for js|
|scrooloose/syntastic|Syntax checking tool|
|psf/black|Formats python code|

## Thanks

- [https://github.com/square/maximum-awesome](https://github.com/square/maximum-awesome)
- [https://github.com/gpakosz/.tmux](https://github.com/gpakosz/.tmux)
- [https://github.com/VSCodeVim/Vim](https://github.com/VSCodeVim/Vim)
