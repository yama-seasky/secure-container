# Use the official Ubuntu base image
FROM ubuntu:26.04

RUN apt update && apt install -y \
    wget git curl sudo && \
    apt clean && rm -rf /var/lib/apt/lists/*
RUN useradd -m devuser \
    && usermod -aG sudo devuser \
    # && usermod -aG docker devuser \
    && echo "devuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && mkdir -p /workspace \
    && chown -R devuser:devuser /workspace \
    && usermod -s /bin/bash devuser
    
USER devuser
ENV SHELL=/bin/bash
WORKDIR /workspace