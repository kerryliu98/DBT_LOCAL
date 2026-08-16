# DBT Local Project (`dbtyz`)

基于 DuckDB 的本地 dbt 数据转换与建模工程。

---

## ⚡ 快速开始 (Quick Start)

### 日常运行 (Daily Run)
在 VS Code / 终端（PowerShell）中执行：

```powershell
# 1. 进入 dbt 项目目录
cd dbtyz

# 2. 激活虚拟环境
..\.venv\Scripts\Activate.ps1

# 3. 运行并测试所有模型
dbt build
```

---

## 🛠️ 首次部署 / 移动文件夹 / 换电脑初始化

由于 Python 虚拟环境（`.venv`）内硬编码了绝对路径，当**移动项目文件夹**或在**新电脑**上拉取项目时，需重新生成虚拟环境：

```powershell
# 1. 切换到项目根目录
cd "c:\Users\Kerry\OneDrive\code\DBT_LOCAL"

# 2. 创建全新虚拟环境
python -m venv .venv

# 3. 激活虚拟环境 (PowerShell)
.venv\Scripts\Activate.ps1

# 如遇权限拦截提示无法运行脚本，执行：
# Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned

# 4. 安装项目依赖
pip install -r requirements.txt

# 5. 验证与运行 dbt
cd dbtyz
dbt debug      # 检查环境与 DuckDB 数据库连接
dbt deps       # 安装 dbt 依赖包
dbt build      # 编译、运行并测试
```

---

## 📖 常用 dbt 命令

| 命令 | 说明 |
| :--- | :--- |
| `dbt build` | 构建并运行所有模型、单元测试与数据测试（推荐） |
| `dbt run` | 仅执行模型生成（视图/表） |
| `dbt test` | 仅执行数据测试和单元测试 |
| `dbt debug` | 测试配置文件 `profiles.yml` 和 DuckDB 数据库连接 |
| `dbt docs generate` | 生成项目数据文档及血缘依赖图 (Lineage Graph) |
| `dbt docs serve` | 启动本地 Web 服务器查看项目文档 |

---

## 📁 目录结构

```text
DBT_LOCAL/
├── .venv/                   # Python 虚拟环境（git 忽略）
├── dbtyz/                   # dbt 核心工程目录
│   ├── analyses/            # 临时分析 SQL
│   ├── analytics.duckdb     # DuckDB 本地数据库文件
│   ├── dbt_project.yml      # dbt 项目主配置文件
│   ├── macros/              # 自定义 Jinja 宏
│   ├── models/              # 数据模型（SQL 文件）
│   ├── seeds/               # 静态 CSV 种子数据
│   ├── snapshots/           # 快照（SCD Type 2）
│   └── tests/               # 自定义测试
├── requirements.txt         # Python 依赖包清单
├── HOW TO RUN.TXT           # 简明运行指南
└── README.md                # 本文档
```
