FROM ubuntu
MAINTAINER Guillaume Claret

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y curl gcc make m4
RUN apt-get install -y git patch unzip

# CI user
RUN useradd --create-home ci
USER ci
ENV HOME /home/ci

# OPAM
WORKDIR /home/ci
RUN curl -L https://github.com/ocaml/opam/releases/download/2.0.5/opam-2.0.5-x86_64-linux >opam
RUN chmod +x opam
USER root
RUN mv opam /usr/local/bin/
USER ci

# Initialize OPAM
WORKDIR /home/ci
RUN opam init -n --disable-sandboxing --compiler=4.02.3
RUN opam repo add coq-released https://coq.inria.fr/opam/released

# Test coq-cybele.1.3.0
RUN opam install coq.8.5.3 -j4 -y
RUN opam install coq-cybele.1.3.0 -y
RUN curl -L https://github.com/clarus/cybele/archive/1.3.0.tar.gz |tar -xz
WORKDIR cybele-1.3.0/test-suite/Congruence
RUN opam exec -- ./configure.sh
RUN opam exec -- make
