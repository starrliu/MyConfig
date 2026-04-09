# zsh 配置

## 文件说明

| 文件 | 说明 |
|------|------|
| `.zshrc` | 主配置文件，包含所有 zsh 选项、alias、prompt 等 |
| `.fzf.zsh` | fzf 模糊搜索工具的 shell 集成脚本（路径为主机特定，需重新生成） |

---

## 安装

### 1. 复制配置文件

```bash
cp .zshrc ~/.zshrc
```

### 2. 安装插件

配置文件依赖以下两个手动管理的插件，需克隆到 `~/.zsh/plugins/`：

```bash
mkdir -p ~/.zsh/plugins

# zsh-autosuggestions：根据历史记录自动补全建议
git clone https://github.com/zsh-users/zsh-autosuggestions \
    ~/.zsh/plugins/zsh-autosuggestions

# zsh-syntax-highlighting：命令行实时语法高亮（必须最后加载）
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
    ~/.zsh/plugins/zsh-syntax-highlighting
```

### 3. 安装 fzf（可选但推荐）

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

安装后 fzf 会自动生成 `~/.fzf.zsh`，`.zshrc` 中已有对应的加载语句。

> **注意**：本 repo 中的 `.fzf.zsh` 路径硬编码为 `/root/.fzf`，在新机器上请
> 重新运行 fzf 安装脚本以覆盖生成。

### 4. 配置主机特定路径

`.zshrc` 末尾有两处被注释掉的主机特定配置，按需启用：

- **Conda 初始化**：运行 `conda init zsh` 可重新自动生成此块
- **opencode PATH**：将注释中的路径替换为实际安装路径后取消注释

### 5. 重载配置

```bash
source ~/.zshrc
# 或使用内置 alias：
reload
```

---

## 配置说明

### 环境变量（第 1 节）

| 变量 | 值 | 说明 |
|------|-----|------|
| `EDITOR` | `vim` | 默认编辑器 |
| `LANG` / `LC_ALL` | `en_US.UTF-8` | 统一 UTF-8 区域设置 |
| `PATH` | `~/.local/bin:~/bin` 前置 | 用户自定义脚本优先于系统命令 |

### 历史记录（第 2 节）

- 保存 50,000 条历史，跨会话共享（`SHARE_HISTORY`）
- 自动去重、忽略重复、忽略以空格开头的命令（避免敏感命令被记录）

### 目录行为（第 3 节）

| 选项 | 效果 |
|------|------|
| `AUTO_CD` | 直接输入目录名即可 cd，无需输入 `cd` |
| `AUTO_PUSHD` | 每次 cd 自动将旧目录压栈，可用 `popd` 返回 |
| `PUSHD_IGNORE_DUPS` | 目录栈中不保存重复条目 |
| `CDABLE_VARS` | 支持 `cd $var` 跳转到变量指定目录 |

### 补全系统（第 5 节）

- 24 小时内复用 `.zcompdump` 缓存，加快启动速度
- 菜单式选择补全（方向键导航）
- 大小写不敏感匹配
- 补全列表使用 `LS_COLORS` 着色

### 键位绑定（第 6 节）

- Emacs 模式（`bindkey -e`）
- 上/下方向键：按当前已输入内容前缀搜索历史（而非逐条翻历史）

### Alias（第 7 节）

| Alias | 展开 | 说明 |
|-------|------|------|
| `ll` | `ls -lhF` | 详细列表，人类可读大小 |
| `la` | `ls -lahF` | 含隐藏文件的详细列表 |
| `rm` / `cp` / `mv` | 加 `-i` | 操作前确认，防误删 |
| `..` / `...` | `cd ..` / `cd ../..` | 快速返回上级目录 |
| `zshrc` | `$EDITOR ~/.zshrc` | 快速编辑 zshrc |
| `reload` | `source ~/.zshrc` | 重载 zshrc |

### Prompt（第 8 节）

Prompt 从左到右依次显示：

1. **Conda 环境**（青色粗体）：仅在激活 conda 环境时显示，如 `[base]`
2. **当前目录**（蓝色）：显示 `~` 开头的相对路径
3. **Git 分支**（黄色）：通过 `vcs_info` 显示，如 `(main)`；处于 rebase/merge 时显示为红色并附带动作名
4. **提示符**（`%` 或 `#`）：普通用户显示 `%`，root 显示 `#`；上条命令成功为绿色，失败为红色

### 插件（第 9-10 节）

| 插件 | 功能 |
|------|------|
| `zsh-autosuggestions` | 根据历史记录和补全系统给出灰色建议，按 `→` 接受 |
| `zsh-syntax-highlighting` | 输入命令时实时高亮：有效命令绿色，无效命令红色，字符串/参数有对应颜色 |
| `fzf` | 模糊搜索：`Ctrl+R` 搜索历史、`Ctrl+T` 搜索文件、`Alt+C` 跳转目录 |
