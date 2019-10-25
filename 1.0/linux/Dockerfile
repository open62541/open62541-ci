FROM debian:buster-slim
MAINTAINER Stefan Profanter <git@s.profanter.me>
ENV DEBIAN_FRONTEND noninteractive

# Install dependencies which are required by almost all builds
RUN apt-get update \
  && apt-get install -y \
      gnupg2 \
      software-properties-common \
      wget \
  && echo 'deb http://apt.llvm.org/buster/ llvm-toolchain-buster-9 main' > /etc/apt/sources.list.d/clang-9.list \
  && wget -qO- https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - \
  && apt update && apt install -y --no-install-recommends \
   binutils-mingw-w64-i686 \
   check \
   clang-6.0 \
   clang-format-6.0 \
   clang-tidy-6.0 \
   cmake \
   debhelper \
   fakeroot \
   g++ \
   g++-multilib \
   gcc \
   gcc-8 \
   gcc-8-multilib \
   gcc-mingw-w64-i686 \
   gcc-mingw-w64-x86-64 \
   git \
   graphviz \
   latexmk \
   libfuzzer-6.0-dev \
   libmbedtls-dev \
   libsubunit-dev \
   make \
   mingw-w64 \
   python-sphinx \
   python-pip \
   python3-pip \
   tar \
   texlive-fonts-recommended \
   texlive-generic-extra \
   texlive-latex-extra \
   valgrind \
   wget \
 && apt clean \
 && rm -rf /var/lib/apt/lists/*

# Pin docutils to version smaller 0.15. Otherwise we run into https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=839299
RUN pip install --user cpp-coveralls \
    pip install --user 'docutils<=0.14' \
    pip install --user sphinx_rtd_theme \
    pip install --user cpplint