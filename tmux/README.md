# tmux 配置

## 安装

将 `.tmux.conf` 放到家目录：

```bash
cp .tmux.conf ~/.tmux.conf
# 若 tmux 已在运行，重载配置：
tmux source-file ~/.tmux.conf
```

---

## 键位映射

### Prefix 键

| 按键 | 说明 |
|------|------|
| `Ctrl+a` | Prefix 键（替代默认的 `Ctrl+b`，更顺手） |

### 分屏

| 按键 | 说明 |
|------|------|
| `Prefix + v` | 垂直分屏（左右，即 vertical split） |
| `Prefix + s` | 水平分屏（上下，即 horizontal split） |

两种分屏均会继承当前 pane 的工作目录。

### Pane 导航（vim 风格）

| 按键 | 说明 |
|------|------|
| `Prefix + h` | 移动到左侧 pane |
| `Prefix + j` | 移动到下方 pane |
| `Prefix + k` | 移动到上方 pane |
| `Prefix + l` | 移动到右侧 pane |

---

## 配置说明

| 配置项 | 值 | 说明 |
|--------|-----|------|
| `prefix` | `Ctrl+a` | 更符合手指习惯的前缀键 |
| `mouse` | on | 支持鼠标点击切换 pane、拖拽调整大小、滚轮翻历史 |
| `base-index` | 1 | 窗口编号从 1 开始，与键盘数字键顺序对齐 |
| `history-limit` | 50000 | 增大滚动缓冲区，适合查看长日志输出 |
| `default-terminal` | `screen-256color` | 启用 256 色支持 |
| `terminal-overrides` | `Tc` | 启用 True Color（24-bit），在支持的终端中生效 |

### 状态栏

状态栏右侧显示：
- 若当前 pane 已缩放（zoom），显示放大镜图标
- 当前时间（黄色，`HH:MM` 格式）
- 当前日期（青色，`DD-Mon` 格式）
