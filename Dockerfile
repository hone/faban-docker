FROM java:8

ADD http://faban.org/downloads/faban-kit-latest.tar.gz /tmp/
RUN tar xf /tmp/faban-kit-latest.tar.gz -C /opt/
ENV PATH /opt/faban/bin:$PATH
RUN mkdir -p /home/user/results
WORKDIR /home/user/results
