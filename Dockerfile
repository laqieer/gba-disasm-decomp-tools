FROM gcc AS installer

ARG PROJECT=pokeemerald
ARG USERNAME=pret

RUN mkdir -p /tools && \
    git clone https://github.com/$USERNAME/$PROJECT.git && \
    cd $PROJECT && make tools && \
    cd tools/ && for d in *; do mv $d/$d /tools; done && \
    cd ../../ && rm -rf $PROJECT && \
    apt-get update && apt-get install -y binutils-arm-none-eabi && \
    git clone https://github.com/pret/agbcc.git && \
    cd agbcc/ && ./build.sh && \
    ./install.sh /tools && \
    cd ../ && rm -rf agbcc

FROM rushmash/gcc-arm-embedded-docker

MAINTAINER laqieer <laqieer@126.com>

COPY --from=installer ["/tools/*", "/usr/local/bin/"]

ENV PATH=/usr/local/bin/agbcc/bin:$PATH
