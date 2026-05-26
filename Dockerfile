FROM ubuntu:20.04

WORKDIR /app
COPY . .
RUN apt update && apt install -y curl && apt clean
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
ENV PATH="/root/.local/bin:$PATH"
RUN /root/.local/bin/uv sync

WORKDIR /app/myproject
CMD ["/root/.local/bin/uv", "run", "manage.py","runserver"]