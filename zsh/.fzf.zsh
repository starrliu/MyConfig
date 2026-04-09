# fzf shell 集成脚本
# 注意：此文件由 fzf 安装脚本自动生成，其中的路径为主机特定路径。
# 在新机器上使用时，请重新运行 fzf 安装脚本（或执行 $(fzf --zsh)）以重新生成本文件。
# 安装方法见 zsh/README.md。

if [[ ! "$PATH" == */root/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/root/.fzf/bin"
fi
source <(fzf --zsh)
