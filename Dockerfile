FROM ubuntu:20.04

WORKDIR /app
COPY . .
RUN apt update && apt install -y curl bzip2 wget && apt clean
RUN curl -LsSf https://astral.sh/uv/install.sh | sh
RUN wget https://ftp.mozilla.org/pub/firefox/releases/100.0/linux-x86_64/ja/firefox-100.0.tar.bz2 && \
    tar -xjvf firefox-100.0.tar.bz2 -C /usr/local && \
    ln -s /usr/local/firefox/firefox /usr/local/bin/firefox
ENV PATH="/root/.local/bin:/usr/local/bin:/usr/local/firefox:$PATH"
RUN /root/.local/bin/uv sync

WORKDIR /app/myproject
CMD ["/root/.local/bin/uv", "run", "manage.py","runserver"]