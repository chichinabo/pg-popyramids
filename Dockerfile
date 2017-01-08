FROM benizar/pg_dw
MAINTAINER Benito Zaragozí <benizar@gmail.com>

######################
# Versions and sources
######################
#from https://github.com/benizar/
ENV SOURCE https://github.com/benizar/
ENV POPYRAMIDS https://github.com/benizar/pg_popyramids.git


################
# Install pg_popyramids
################
WORKDIR /install-ext
RUN git clone $POPYRAMIDS
WORKDIR /install-ext/pg_popyramids
RUN make
RUN make install


WORKDIR /install-ext
ADD init-db.sh /docker-entrypoint-initdb.d/init-db.sh


WORKDIR /
RUN rm -rf /install-ext


