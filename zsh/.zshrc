# ═══════════════════════════════════════════
# ~/.zshrc
# ═══════════════════════════════════════════

# ── 1. 环境变量 ─────────────────────────────
export EDITOR='vim'
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# ── 2. 历史记录 ─────────────────────────────
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# ── 3. 目录行为 ─────────────────────────────
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CDABLE_VARS

# ── 4. 其他选项 ─────────────────────────────
setopt CORRECT
setopt INTERACTIVE_COMMENTS
setopt NO_BEEP

# ── 5. 补全系统 ─────────────────────────────
autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
    compinit
else
    compinit -C
fi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zmodload zsh/complist

# ── 6. 键位绑定 ─────────────────────────────
bindkey -e
autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# ── 7. Alias ────────────────────────────────
alias ls='ls --color=auto'
alias ll='ls -lhF'
alias la='ls -lahF'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -h'
alias ..='cd ..'
alias ...='cd ../..'
alias zshrc='${EDITOR} ~/.zshrc'
alias reload='source ~/.zshrc'

# ── 8. Prompt ───────────────────────────────
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{red}(%b|%a)%f'
setopt PROMPT_SUBST
PROMPT='%F{green}${CONDA_DEFAULT_ENV:+[%B%F{cyan}$CONDA_DEFAULT_ENV%f%b] }%f%F{blue}%~%f${vcs_info_msg_0_} %F{%(?.green.red)}%#%f '

# ── 9. 插件 ─────────────────────────────────
if [[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# ── 10. 工具初始化 ───────────────────────────
# syntax-highlighting 必须最后 source
if [[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# >>> conda initialize >>>
# 注意：以下为主机特定路径，使用时请替换为实际的 conda 安装路径
# 可通过 `conda init zsh` 重新生成此块
# __conda_setup="$('/path/to/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/path/to/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/path/to/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/path/to/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

# fzf 集成（由 fzf 安装脚本自动生成，路径为主机特定）
# 使用时请运行 fzf 安装脚本重新生成，或手动 source ~/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ── 工具路径（主机特定，按需启用）────────────
# opencode（替换为实际安装路径）
# export PATH=/path/to/.opencode/bin:$PATH
