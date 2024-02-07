# dotfiles

macOS和Linux上的tmux + vim + zsh的环境配置，保持简单易扩展。

## 安装

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/yingca1/dotfiles/master/install.sh)"
```

## 如何使用

### tmux

- `<C-a>`和`<C-b>`都是前缀键
- 鼠标滚动启动tmux滚动
- `prefix v`进行垂直分割
- `prefix s`进行水平分割

如果您有三个或更多窗格：

- `prefix +`打开主水平布局
- `prefix =`打开主垂直布局

您可以通过降低或增加`tmux.conf`中的`other-pane-height`和`other-pane-width`选项来调整较小窗格的大小。

### vim

以下假设您的领导键设置为`\`。

- `\d`打开[NERDTree](https://github.com/scrooloose/nerdtree)，一个用于导航和操作文件的侧边栏缓冲区
- `\t`打开[ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim)，一个项目文件过滤器，可轻松打开特定文件
- `\b`限制ctrlp.vim打开缓冲区
- `\a`使用[银色搜索器](https://github.com/ggreer/the_silver_searcher)（类似于ack，但更快）启动项目搜索，使用[ag.vim](https://github.com/rking/ag.vim)
- `ds`/`cs`删除/更改周围字符（例如，`"Hey!"` + `ds"` = `Hey!`，`"Hey!"` + `cs"'` = `'Hey!'`）使用[vim-surround](https://github.com/tpope/vim-surround)
- `gcc`切换当前行注释
- `gc`切换可视选择注释行
- `vii`/`vai`在光标缩进处选择_in_或_around_
- `Vp`/`vp`用默认寄存器替换可视选择 _without_ 复制选定文本（适用于任何可视选择）
- `\[space]`删除尾随空格
- `<C-]>`使用ctags跳转到定义
- `\l`开始将行对齐到字符串，通常用作`\l=`以对齐分配
- `<C-hjkl>`在窗口之间移动，缩写为`<C-w> hjkl`

#### 插件说明

- 使用Plug管理插件，请在打开vim后使用命令:PlugInstall安装插件
- 插件安装取决于访问GitHub上的存储库，请确保连接到github.com
- 需要将本地id_isa.pub添加到GitHub个人设置中的SSH密钥中
- 对于更多插件，请访问[https://vimawesome.com/](https://vimawesome.com/)

##### 默认安装

|插件|备注|
|---|---|
|christoomey/vim-tmux-navigator|与tmux分屏无缝集成|
|preservim/nerdtree|文件导航侧边栏|
|junegunn/fzf.vim|命令行模糊搜索工具，ripgrep，bat，fd-find，silversearcher-ag，fzf|
|ctrlpvim/ctrlp.vim|在项目中检索项目文件|
|justinmk/vim-sneak|定位前后两个字符|
|easymotion/vim-easymotion|通过锚点快速导航文件内部|
|tpope/vim-surround|更改、删除周围字符或标记|
|tpope/vim-dispatch|用于异步使用的工具。[视频演示](https://vimeo.com/63116209)|
|tpope/vim-unimpaired|支持许多配对操作，如交换行|
|tpope/vim-repeat|增强本地' . '重复功能，支持多个插件|
|airblade/vim-gitgutter|在文件左侧显示git状态|
|tpope/vim-fugitive|常见的git命令|
|bling/vim-airline|漂亮的底部状态栏|
|nathanaelkane/vim-indent-guides|可视化行缩进|
|godlygeek/tabular|对齐文本，例如表格。[屏幕录制演示](http://vimcasts.org/episodes/aligning-text-with-tabular-vim/)|
|vim-scripts/Align|对齐代码，例如声明变量时|
|tpope/vim-commentary|注释和取消注释|
|mattn/emmet-vim|快速编写xml的工具|

##### 可选安装

|插件|备注|
|---|---|
|majutsushi/tagbar|为轻松浏览生成文件内容轮廓|
|rking/ag.vim|项目内的全文搜索|
|[garbas/vim-snipmate](https://github.com/garbas/vim-snipmate)|管理代码片段|
|tomtom/tlib_vim|SnipMate的依赖项|
|MarcWeber/vim-addon-mw-utils|SnipMate的依赖项|
|pangloss/vim-javascript|js的缩进和语法支持|
|scrooloose/syntastic|语法检查工具|
|psf/black|格式化python代码|

## 感谢

- [https://github.com/square/maximum-awesome](https://github.com/square/maximum-awesome)
- [https://github.com/gpakosz/.tmux](https://github.com/gpakosz/.tmux)
- [https://github.com/VSCodeVim/Vim](https://github.com/VSCodeVim/Vim)
