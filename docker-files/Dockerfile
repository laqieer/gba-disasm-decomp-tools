FROM gcc:latest

MAINTAINER laqieer <laqieer@126.com>

RUN git clone https://github.com/pret/agbcc.git && \
    cd agbcc/ && ./build.sh && \
    ./install.sh /usr/local/bin && \
    cd ../ && rm -rf agbcc/ && \
    git clone https://github.com/pret/pokeemerald.git && \
    cd pokeemerald/ && make tools && \
    cp -rf tools/ /usr/local/bin && \
    cd ../ && rm -rf pokeemerald/

ENV PATH=/usr/local/bin/tools/agbcc/bin: \
    /usr/local/bin/tools/aif2pcm: \
    /usr/local/bin/tools/bin2c: \
    /usr/local/bin/tools/gbafix: \
    /usr/local/bin/tools/gbagfx: \
    /usr/local/bin/tools/jsonproc: \
    /usr/local/bin/tools/mapjson: \
    /usr/local/bin/tools/mid2agb: \
    /usr/local/bin/tools/preproc: \
    /usr/local/bin/tools/ramscrgen: \
    /usr/local/bin/tools/rsfont: \
    /usr/local/bin/tools/scaninc: \
    $PATH
