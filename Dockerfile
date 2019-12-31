FROM centos:7
RUN yum install java-1.7.0-openjdk.x86_64 zip -y
RUN yum search java|grep jdk
RUN mkdir /service
ADD ai-rec-1.0.0-all.tar.gz /service
WORKDIR /service
COPY start.sh /service/bin
RUN chmod o+x /service/bin/start.sh
ENV PATH "${PATH}:/opt/jdk1.7.0_80/bin/"
EXPOSE 8085
CMD ["./bin/start.sh"]
