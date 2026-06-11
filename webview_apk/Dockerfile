# Dockerfile for building Android APK with Buildozer
FROM ubuntu:22.04

# 设置环境变量
ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_HOME=/root/.buildozer/android/platform/android-sdk
ENV PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# 更新系统并安装依赖
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip \
    openjdk-17-jdk \
    python3-pip \
    autoconf \
    libtool \
    pkg-config \
    zlib1g-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libtinfo5 \
    cmake \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# 安装 Buildozer
RUN pip3 install buildozer==1.4.0

# 创建工作目录
WORKDIR /app

# 复制项目文件
COPY . .

# 运行 Buildozer
CMD ["buildozer", "android", "debug"]