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

# Test coq-of-ocaml.1.1.1
RUN time opam switch create ocaml-base-compiler.4.02.3
RUN time opam install coq.8.5.3 -j4 -y
RUN opam install coq-of-ocaml.1.1.1 -y
RUN opam exec -- coqOfOCaml.native --help
COPY input.ml output.v ./
RUN opam exec -- ocamlc -bin-annot input.ml
RUN opam exec -- coqOfOCaml.native -mode v input.cmt |diff -su output.v -
RUN opam remove coq-of-ocaml

# Test coq-of-ocaml.1.2.1
RUN time opam switch create ocaml-base-compiler.4.05.0
RUN time opam install coq.8.9.0 -j4 -y
RUN opam install coq-of-ocaml.1.2.1 -y
RUN opam exec -- coqOfOCaml.native --help
COPY input.ml output.v ./
RUN opam exec -- ocamlc -bin-annot input.ml
RUN opam exec -- coqOfOCaml.native -mode v input.cmt |diff -su output.v -
RUN opam remove coq-of-ocaml
