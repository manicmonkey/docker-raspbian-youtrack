FROM manicmonkey/raspbian-jdk8
MAINTAINER James Baxter <j.w.baxter@gmail.com>

# Download youtrack
WORKDIR /opt
RUN wget -O youtrack.jar http://download.jetbrains.com/charisma/youtrack-6.5.16807.jar

VOLUME ["/data"]
EXPOSE 8080
CMD ["java", "-Xmx1g", "-Djava.awt.headless=true", "-Ddatabase.location=/data", "-jar", "youtrack.jar", "8080"]
