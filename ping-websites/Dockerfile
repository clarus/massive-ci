FROM ubuntu
MAINTAINER Guillaume Claret

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y curl iputils-ping

# Home page
RUN ping -c1 guillaume.claret.me
RUN curl -L guillaume.claret.me |grep "Guillaume Claret"

# Coq blog
RUN ping -c1 coq-blog.clarus.me
RUN curl -L coq-blog.clarus.me |grep "Coq blog"

# Coq bench
RUN ping -c1 coq-bench.github.io
RUN curl -L coq-bench.github.io |grep "Coq bench"

# Coq.io
RUN ping -c1 coq.io
RUN curl -L coq.io |grep "Coq.io"
