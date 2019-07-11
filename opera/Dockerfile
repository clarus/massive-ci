FROM r-base
MAINTAINER Guillaume Claret
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y curl

# Test opera 1.0
WORKDIR /root
RUN curl -L https://github.com/Dralliag/opera/archive/v1.0.tar.gz |tar -xz
WORKDIR opera-1.0
RUN echo 'install.packages("opera")' |R --no-save
RUN echo 'install.packages("mgcv")' |R --no-save
RUN echo 'install.packages("caret")' |R --no-save
RUN echo 'install.packages("gbm")' |R --no-save
RUN R --no-save <vignettes/opera-vignette.R
