FROM devkitpro/devkitarm AS installer

ARG PROJECT=fireemblem8u
ARG USERNAME=FireEmblemUniverse

RUN mkdir -p /tools && \
    apt-get update && apt-get install -y build-essential libpng-dev && \
    git clone https://github.com/$USERNAME/$PROJECT.git && \
    cd $PROJECT && ./build_tools.sh && \
    cd tools/ && for d in *; do mv $d/$d /tools; done && \
    cd ../../ && rm -rf $PROJECT && \
    git clone https://github.com/pret/agbcc.git && \
    cd agbcc/ && ./build.sh && \
    ./install.sh /tools && \
    cd ../ && rm -rf agbcc

FROM devkitpro/devkitarm AS final

MAINTAINER laqieer <laqieer@126.com>

COPY --from=installer ["/tools/*", "/usr/local/bin/"]

ENV PATH=/usr/local/bin/agbcc/bin:$DEVKITARM/bin:$PATH
