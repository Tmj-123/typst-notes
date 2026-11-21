# 静力平衡推导笔记（Typst）

大气动力学课后作业：用 Typst 排版《静力平衡：从垂直动量方程到压高公式》，并导出 PDF 上交。

- 学号 / 姓名：046241 唐敏嘉
- 上交文件：`046241_唐敏嘉.pdf`
- 排版工具：Typst 0.15.1 + 本地模板包 `@local/modern-cug-report:0.1.3`

## 文件说明

| 文件 | 说明 |
| --- | --- |
| `task1.typ` | 本次上交的笔记源文件（正文，使用了 `#box-blue`、`@eq_1` 等模板功能） |
| `046241_唐敏嘉.pdf` | 由 `task1.typ` 编译得到的 PDF，命名规则 `046241_姓名.pdf` |
| `静力平衡.typ` | 同一内容的展开版，含自定义 `show ref` 规则、公式统一加框等教学要点 |
| `静力平衡.pdf` | 展开版的编译结果 |
| `hello.typ` | 模板功能试验稿（标题层级、公式、表格、图片、代码块等） |
| `figure/` | 图片素材 |

## 编译方法

```bash
# 依赖本地包: %APPDATA%\typst\packages\local\modern-cug-report\0.1.3
typst compile task1.typ 046241_唐敏嘉.pdf
```

实时预览：

```bash
typst watch task1.typ 046241_唐敏嘉.pdf
```

## 操作步骤总结

1. **装工具**：`scoop install typst`，确认 `typst --version` → 0.15.1。
2. **放模板**：把 `modern-cug-report` 包解压到 `%APPDATA%\typst\packages\local\modern-cug-report\0.1.3`
   （`local` 目录对应 `#import "@local/..."` 前缀，版本号目录名必须与 `0.1.3` 一致）。
3. **摸语法**：先在 `hello.typ` 里试标记语法——`=`/`==` 标题层级、`$...$` 行内与行间公式、
   `<eq_1>` 标签 + `@eq_1` 交叉引用、`table()` + `figure()` + `caption()`、`#box-blue[...]` 等。
4. **写正文**：按“问题 → 出发点（垂直动量方程）→ 尺度分析（表 1）→ 积分形式 → 检验与适用条件 → 小结”的
   逻辑组织，公式逐条编号，引用写成 `@eq_1`、`@tab_1`。
5. **调格式**：加 `#set heading(numbering: "1.")`、`#show math.equation.where(block: true)` 统一给
   行间公式加框，并用 `#show ref` 把引用渲染成“式 (1)”“表 1”。
6. **编译检查**：`typst compile` 后翻页检查公式断行、表格边框、交叉引用编号是否正常。
7. **按命名规则产出**：`046241_唐敏嘉.pdf`，源文件与 PDF 一起提交到 GitHub。

## 存在的问题

- **本地包路径是机器相关的**：模板放在 `%APPDATA%\typst\packages\local\...`，换电脑或重装系统必须先补上这个包，
  否则 `#import "@local/modern-cug-report:0.1.3"` 直接报找不到包。
- **PDF 里的中文不能搜索/复制**：导出的 PDF 没有可用的 ToUnicode 映射，`pdftotext` 抓出来是乱码，
  只能看排版效果，正文文字无法直接复用（评阅时若需要复制公式要注意）。
- **长公式容易超出版心**：`$...$` 行间公式不会自动折行，太长的式子要手动 `\` 断行或用 `cases` 拆。
- **中文与数学混排的字距**：中文字符和 `$v$`、`$rho$` 紧贴时显得挤，需要在源码里手动补空格。
- **交叉引用编号依赖顺序**：`@eq_1` 的编号由公式出现顺序决定，中间插入新公式后编号会整体后移，
  要重新核对正文里“式 (2)、式 (3)”的指代是否还对应。
- **模板改动容易连带出错**：`#show ref` / `#show math.equation` 这类全局 `show` 规则一旦写错，
  全文所有引用和公式一起失效，调试时只能先注释掉再逐条加回。
- **图与表的手工对齐**：`table()` 的 `columns: (auto, auto, auto)` 在本机列宽合适，但正文一变宽
  （改纸张或字号）就可能换行错位，需要重新调 `columns` 的权重。
