# 使用 Python 3.12 作为基础镜像
FROM python:3.12-slim

# 设置工作目录
WORKDIR /app

# 复制项目文件
COPY . .

# 安装项目依赖
RUN apt-get update && apt-get install -y --no-install-recommends gcc python3-dev
RUN pip install uvicorn
RUN uv pip install -e .

# 暴露端口
EXPOSE 8080

# 设置环境变量（需要在 docker-compose.yml 中定义 MEM0_API_KEY）
ENV MEM0_API_KEY=your_api_key_here

# 运行服务器
CMD ["uv", "run", "main.py"]
