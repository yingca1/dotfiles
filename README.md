# dotfiles

快速搭建基于 tmux + vim + zsh 的终端下开发环境。

## 安装

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yingca1/dotfiles/master/install.sh)"
```

## 常用操作

### vim

The following assume your leader key is set to `\`.

* `\d` brings up [NERDTree](https://github.com/scrooloose/nerdtree), a sidebar buffer for navigating and manipulating files
* `\t` brings up [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim), a project file filter for easily opening specific files
* `\b` restricts ctrlp.vim to open buffers
* `\a` starts project search with [ag.vim](https://github.com/rking/ag.vim) using [the silver searcher](https://github.com/ggreer/the_silver_searcher) (like ack, but faster)
* `ds`/`cs` delete/change surrounding characters (e.g. `"Hey!"` + `ds"` = `Hey!`, `"Hey!"` + `cs"'` = `'Hey!'`) with [vim-surround](https://github.com/tpope/vim-surround)
* `gcc` toggles current line comment
* `gc` toggles visual selection comment lines
* `vii`/`vai` visually select *in* or *around* the cursor's indent
* `Vp`/`vp` replaces visual selection with default register *without* yanking selected text (works with any visual selection)
* `\[space]` strips trailing whitespace
* `<C-]>` jump to definition using ctags
* `\l` begins aligning lines on a string, usually used as `\l=` to align assignments
* `<C-hjkl>` move between windows, shorthand for `<C-w> hjkl`

### tmux

* `<C-a>` is the prefix
* mouse scroll initiates tmux scroll
* `prefix v` makes a vertical split
* `prefix s` makes a horizontal split

If you have three or more panes:
* `prefix +` opens up the main-horizontal-layout
* `prefix =` opens up the main-vertical-layout

You can adjust the size of the smaller panes in `tmux.conf` by lowering or increasing the `other-pane-height` and `other-pane-width` options.

## 插件说明

- 使用 Plug 管理插件，记得打开 vim 后，使用命令 :PlugInstall 安装插件
> 插件安装依赖访问github的仓库，请注意：
> 1. 需保证github.com网络通畅
> 2. 需将本地的id_isa.pub添加到github的个人设置的SSH keys中
- 更多插件，可前往 https://vimawesome.com/

| 插件                                                         | 用途                                                         |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| airblade/vim-gitgutter                                       | 根据 git 变更在文件左侧显示状态                              |
| christoomey/vim-tmux-navigator                               | 和 tmux 分屏无缝搭配                                         |
| kien/ctrlp.vim                                               | 项目内文件检索                                               |
| majutsushi/tagbar                                            | 生成文件内容大纲，方便浏览                                   |
| rking/ag.vim                                                 | 项目内全文本检索                                             |
| [garbas/vim-snipmate](https://github.com/garbas/vim-snipmate) | 管理代码片段                                                 |
| tomtom/tlib_vim                                              | 被 SnipMate 依赖                                             |
| MarcWeber/vim-addon-mw-utils                                 | 被 SnipMate 依赖                                             |
| nathanaelkane/vim-indent-guides                              | 可视化展示行首缩进                                           |
| pangloss/vim-javascript                                      | 针对 js 的缩进和语法支持                                     |
| mattn/emmet-vim                                              | 快速写 xml 的工具                                            |
| godlygeek/tabular                                            | 对齐文本，如表格等。[录屏演示](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/) |
| easymotion/vim-easymotion                                    | 文件内根据锚点快速跳转                                       |
| scrooloose/nerdtree                                          | 文件导航栏                                                   |
| scrooloose/syntastic                                         | 语法检测工具                                                 |
| tpope/vim-commentary                                         | 注释与反注释                                                 |
| tpope/vim-dispatch                                           | 用来异步的工具。[视频演示](https://vimeo.com/63116209)       |
| tpope/vim-fugitive                                           | git 常用指令                                                 |
| tpope/vim-repeat                                             | 增强原生「 . 」重复功能，支持多种插件                        |
| tpope/vim-surround                                           | 更改、删除包裹文本的符号或者标签                             |
| tpope/vim-unimpaired                                         | 支持很多种成对操作，如交换行等                               |
| vim-scripts/Align                                            | 对齐代码，例如在变量声明时                                   |
| bling/vim-airline                                            | 挺不错的底部状态栏                                           |
| psf/black                                                    | 格式化 python 代码                                           |

## Thanks

- https://github.com/square/maximum-awesome
- https://github.com/gpakosz/.tmux
- https://github.com/VSCodeVim/Vim
