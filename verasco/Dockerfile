FROM ubuntu
MAINTAINER Guillaume Claret

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y apt-utils
RUN apt-get install -y gcc make git
RUN apt-get install -y curl m4 ruby
RUN apt-get install -y aspcud mercurial
RUN apt-get install -y g++ coinor-csdp
RUN apt-get install -y unzip ocaml
RUN apt-get install -y autoconf perl time

# CI user
RUN useradd --create-home ci
USER ci
ENV HOME /home/ci

# OPAM
WORKDIR /home/ci
RUN curl -L https://github.com/ocaml/opam/releases/download/2.0.4/opam-full-2.0.4.tar.gz |tar -xz
WORKDIR opam-full-2.0.4
RUN ./configure && time make lib-ext && time make
USER root
RUN make install
USER ci

# Initialize OPAM
WORKDIR /home/ci
RUN opam init -n --disable-sandboxing
RUN opam repo add coq-released https://coq.inria.fr/opam/released --set-default

# Test of Verasco 1.3
USER root
RUN apt-get install -y libgmp-dev libc6-dev-i386 nano
USER ci
RUN time opam switch create ocaml-base-compiler.4.02.3
RUN time opam install coq.8.4.6 -j4 -y
RUN time opam install batteries menhir.20151112 ocamlscript zarith -j4 -y
RUN curl -L http://compcert.inria.fr/verasco/release/verasco-1.3.tgz |tar -xz
WORKDIR verasco-1.3
RUN opam exec -- ./configure ia32-linux -prefix `opam var prefix`
RUN opam exec -- time make -j4
RUN opam exec -- ./RunTests |grep -i error| wc -l |grep -e "^0$"
