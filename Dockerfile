ARG IMAGE=intersystemsdc/irishealth-community:latest
FROM $IMAGE as builder

WORKDIR /home/irisowner/dev

COPY ./ ./

# --- Add Java 11 installation steps ---
USER root
# Update package list and install OpenJDK 11 JRE (or JDK if you need it for compilation)
RUN apt-get update && \
    apt-get install -y openjdk-11-jre && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Note: openjdk-11-jre is sufficient for running Java applications.
# If you need the full JDK for building/compiling inside the container, use 'openjdk-11-jdk'.
# Setting JAVA_HOME is often helpful but not always strictly necessary for 'jre'
# as the binaries are added to the PATH, but it's good practice:
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64 \
    PATH=$PATH:/usr/lib/jvm/java-11-openjdk-amd64/bin
# -------------------------------------

ENV IRISUSERNAME "_SYSTEM" \
    IRISPASSWORD "SYS" \
    PYTHON_PATH=/usr/bin/python3 \
    PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"


USER ${ISC_PACKAGE_MGRUSER}
RUN iris start IRIS \
    && iris session IRIS < iris.script | tee /home/irisowner/dev/build.log \
    && iris stop IRIS quietly