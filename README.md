# `.vim`

> Make sure use Vim >= 8.1.1719 or Neovim >= 0.4.0.
>
> Install nodejs >= 16.18.0:

## 初始化插件

`git submodule update --init --recursive`

### COC

```bash
cd pack/vendor/start/coc.nvim
npm ci
```

- `:CocInstall coc-pyright coc-markdownlint coc-json coc-git coc-sh coc-webview coc-markdown-preview-enhanced`

## 更新插件

`git submodule update --remote --merge`

## 添加插件

 `git submodule add <remote_repo> pack/vendor/start/<repo_name>`

## 删除插件

- 在 `.gitmodules` 文件中删除相关的条目
- 在 `.git/config` 文件中删除相关的条目。
- 运行 `git rm --cached path/to/submodule`（不带尾部的斜杠）
- 提交这些更改并删除未跟踪的 Submodule 文件。

## 添加文档标签

```bash
for i in $(ls pack/vendor/start); do
    vim -u NONE -c "helptags pack/vendor/start/$i/doc" -c q;
done
```
