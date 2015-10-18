FROM resin/rpi-raspbian:jessie
MAINTAINER James Baxter <j.w.baxter@gmail.com>

# Install wget
RUN \
  apt-get update && \
  apt-get install wget -y

# Install Java.
RUN \
  wget --progress=bar --no-check-certificate -O /tmp/jdk.tar.gz --header "Cookie: oraclelicense=a" http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-arm32-vfp-hflt.tar.gz && \
  tar xvf /tmp/jdk.tar.gz && \
  rm /tmp/jdk.tar.gz && \
  mkdir -p /usr/lib/jvm/java-8-oracle && \
  mv jdk1.8.0_60/jre /usr/lib/jvm/java-8-oracle/jre && \
  rm -r jdk1.8.0_60 && \
  chown root:root -R /usr/lib/jvm/java-8-oracle/jre && \
  update-alternatives --install /usr/bin/java java /usr/lib/jvm/java-8-oracle/jre/bin/java 1 && \
  update-alternatives --set java /usr/lib/jvm/java-8-oracle/jre/bin/java

# Download youtrack
WORKDIR /opt
RUN wget -O youtrack.jar http://download.jetbrains.com/charisma/youtrack-6.5.16807.jar

VOLUME ["/data"]
EXPOSE 8080
CMD ["java", "-Xmx1g", "-Djava.awt.headless=true", "-Ddatabase.location=/data", "-jar", "youtrack.jar", "8080"]
