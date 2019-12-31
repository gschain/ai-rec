FROM centos
RUN yum install zip -y
ADD jdk1.7.0_80.tar.gz /opt
ENV JAVA_HOME  /opt/jdk1.7.0_80
RUN mkdir /service
ADD ai-rec-1.0.0-all.tar.gz /service
WORKDIR /service
COPY start.sh /service/bin
RUN chmod o+x /service/bin/start.sh
ENV PATH "${PATH}:/opt/jdk1.7.0_80/bin/"
EXPOSE 8085
CMD ["./bin/start.sh"]
