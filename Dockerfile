FROM ubuntu:20.04

WORKDIR /app
RUN apt update && apt install -y curl && apt clean
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"
RUN uv sync --no-dev --no-lock --no-cache

WORKDIR /app/myproject
CMD ["uv", "run", "manage.py","runserver"]