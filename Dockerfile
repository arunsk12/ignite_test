# Use OpenJDK 11 as base image
FROM openjdk:11-jre-slim

# Set Apache Ignite version
ENV IGNITE_VERSION 2.14.0

# Download and extract Apache Ignite
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://archive.apache.org/dist/ignite/$IGNITE_VERSION/apache-ignite-$IGNITE_VERSION-bin.zip && \
    unzip apache-ignite-$IGNITE_VERSION-bin.zip -d /opt && \
    rm apache-ignite-$IGNITE_VERSION-bin.zip

# Set Ignite home directory
ENV IGNITE_HOME /opt/apache-ignite-$IGNITE_VERSION-bin

# Expose Ignite communication and client ports
EXPOSE 47500 47100 10800

# Set the working directory
WORKDIR $IGNITE_HOME

# Start Ignite node in server mode
CMD ["sh", "-c", "$IGNITE_HOME/bin/ignite.sh"]
