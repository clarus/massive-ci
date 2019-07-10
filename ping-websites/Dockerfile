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

# Friends
RUN ping -c1 a3nm.net
RUN curl -L a3nm.net |grep "Antoine Amarilli"
RUN ping -c1 scaron.info
RUN curl -L scaron.info |grep "Stéphane Caron"
RUN ping -c1 pierre.gaillard.me
RUN curl -L pierre.gaillard.me |grep "Pierre Gaillard"
RUN ping -c1 jhjourdan.mketjh.fr
RUN curl -L jhjourdan.mketjh.fr |grep "Jacques-Henri Jourdan"
RUN ping -c1 cs.nyu.edu
RUN curl -L cs.nyu.edu/~mathieu |grep "Michael Mathieu"
RUN ping -c1 pablo.rauzy.name
RUN curl -L pablo.rauzy.name |grep "Pablo Rauzy"
RUN ping -c1 guillaume.segu.in
RUN curl -L guillaume.segu.in |grep "Guillaume Seguin"
