FROM gcc:latest

MAINTAINER laqieer <laqieer@126.com>

RUN git clone https://github.com/pret/agbcc.git
RUN cd agbcc/ && ./build.sh
RUN ./install.sh /usr/local/bin
RUN cd ../ && rm -rf agbcc/

RUN git clone https://github.com/pret/pokeemerald.git
RUN cd pokeemerald/ && make tools
RUN cp -rf tools/ /usr/local/bin
RUN cd ../ && rm -rf pokeemerald/

ENV PATH=/usr/local/bin/tools/agbcc/bin:$PATH
ENV PATH=$PATH\$( find /usr/local/bin/tools/ -type d -printf ":%p" )
