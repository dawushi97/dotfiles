# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.

# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"

# Conditionally set theme for Cursor
if [[ -n $CURSOR_TRACE_ID ]]; then
  ZSH_THEME="robbyrussell"  # Use a simpler theme in Cursor
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	zsh-autosuggestions 
	zsh-syntax-highlighting
	z
	#zsh-vi-mode
	brew
)

# FZF 增强配置
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git --exclude node_modules'
export FZF_DEFAULT_OPTS="
  --height 40%
  --layout=reverse
  --border
  --preview-window='right:50%'
  --preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
  --bind='ctrl-/:toggle-preview'
  --bind='ctrl-u:preview-half-page-up'
  --bind='ctrl-d:preview-half-page-down'
  --bind='ctrl-a:select-all'
  --bind='ctrl-y:execute-silent(echo {+} | pbcopy)'
"

# 设置 FZF 使用 tmux 弹出窗口（如果你使用 tmux）
export FZF_TMUX=1

# 目录搜索配置
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git --exclude node_modules'
export FZF_ALT_C_OPTS="
  --preview 'tree -C {} | head -200'
  --preview-window='right:60%'
"

# 文件搜索配置
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  --preview 'bat --style=numbers --color=always --line-range :500 {}'
  --preview-window='right:60%'
"

source $ZSH/oh-my-zsh.sh

# FZF 加载 (需要放在 zsh-vi-mode 后面)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 修复 zsh-vi-mode 和 fzf 键位冲突
function zvm_after_init() {
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# Conditionally source p10k config
if [[ ! -n $CURSOR_TRACE_ID ]]; then
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/sbin:$PATH"
# Qt6 配置
#export PATH="/opt/homebrew/Cellar/qt/6.7.2_1/bin:$PATH"
#export LDFLAGS="-L/opt/homebrew/Cellar/qt/6.7.2_1/lib"
#export CPPFLAGS="-I/opt/homebrew/Cellar/qt/6.7.2_1/include"

# Qt5 配置 (注意使用 $LDFLAGS 和 $CPPFLAGS 来追加而不是覆盖)
#export PATH="/opt/homebrew/Cellar/qt@5/5.15.15/bin:$PATH"
#export LDFLAGS="$LDFLAGS -L/opt/homebrew/Cellar/qt@5/5.15.15/lib"
#export CPPFLAGS="$CPPFLAGS -I/opt/homebrew/Cellar/qt@5/5.15.15/include"xport CPPFLAGS="$CPPFLAGS -I/opt/homebrew/Cellar/qt@5/5.15.15/include"xport CPPFLAGS="$CPPFLAGS -I/opt/homebrew/Cellar/qt@5/5.15.15/include"

#yazi funcitons
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}
# Added by Windsurf
export PATH="/Users/zhangyishun/.codeium/windsurf/bin:$PATH"
