# My xmake-repo

个人 xmake 包仓库。

## 使用方法

在你的项目 `xmake.lua` 中添加：

```lua
add_repositories("onePercent-repo https://github.com/onePercentzcl/xmake-repo")
```

## 包列表

### oneplog

高性能 C++17 多进程日志系统。

- 主页: https://github.com/onePercentzcl/oneplog
- 许可证: MIT
- 版本: v0.0.1

**配置选项：**

| 选项 | 默认值 | 说明 |
|------|--------|------|
| shared | false | 构建动态库 |
| header_only | false | 使用 header-only 模式 |
| use_fmt | true | 使用内置 fmt 库 |

**示例：**

```lua
add_requires("oneplog")

target("myapp")
    set_kind("binary")
    set_languages("c++17")
    add_files("*.cpp")
    add_packages("oneplog")
```

---

### spdlog-mp

基于 spdlog 的多进程共享内存日志扩展。

- 主页: https://github.com/onePercentzcl/spdlog-mp
- 许可证: MIT

**配置选项：**

| 选项 | 默认值 | 说明 |
|------|--------|------|
| enable_multiprocess | true | 启用多进程共享内存支持 |
| header_only | false | 使用 header-only 版本 |
| std_format | false | 使用 std::format 替代 fmt |
| fmt_external | false | 使用外部 fmt 库 |
| noexcept | false | 禁用异常 |

**示例：**

```lua
add_requires("spdlog-mp", {configs = {enable_multiprocess = true}})
```
