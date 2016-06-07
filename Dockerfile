FROM jruby:9.1.0.0-jdk

ADD http://faban.org/downloads/faban-kit-latest.tar.gz /tmp/
RUN tar xf /tmp/faban-kit-latest.tar.gz -C /opt/
RUN mkdir -p /opt/faban-toolkit/
ADD faban.rb /opt/faban-toolkit/
ADD path.rb /opt/faban-toolkit/
ADD faban-run.sh /opt/faban-toolkit/
ENV PATH /opt/faban/bin:/opt/faban-toolkit/:$PATH
ENV FABAN_HOME /opt/faban/
RUN mkdir -p /home/user/results
WORKDIR /home/user/results
