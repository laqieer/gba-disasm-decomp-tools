FROM hiberglobal/gcc-arm-none-eabi AS installer

ARG PROJECT=pokeemerald
ARG USERNAME=pret
ARG BUILD_TOOLS=make\ tools

RUN mkdir -p /tools && \
    apk add -U git bash build-base libpng-dev && \
    git clone https://github.com/$USERNAME/$PROJECT.git && \
    cd $PROJECT && $BUILD_TOOLS && \
    cd tools/ && for d in *; do mv $d/$d /tools; done && \
    cd ../../ && rm -rf $PROJECT && \
    git clone https://github.com/pret/agbcc.git && \
    cd agbcc/ && ./build.sh && \
    ./install.sh /tools && \
    cd ../ && rm -rf agbcc

FROM hiberglobal/gcc-arm-none-eabi AS final

MAINTAINER laqieer <laqieer@126.com>

COPY --from=installer ["/tools/*", "/usr/local/bin/"]

ENV PATH=/usr/local/bin/agbcc/bin:$PATH
ENV C_INCLUDE_PATH=/usr/local/bin/agbcc/include:$C_INCLUDE_PATH

RUN apk add -U make libstdc++ libpng --no-cache
