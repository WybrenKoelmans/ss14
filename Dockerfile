# Build stage
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS build

# Set build argument for SS14 server version
ARG SS14_VERSION=
ARG SS14_CDN=
ARG SS14_FORK=

# Update and install necessary tools
RUN apt-get -y update && \
    apt-get -y install curl unzip wget git

WORKDIR /server

# Use the build argument in the wget command
RUN wget https://${SS14_CDN}/fork/${SS14_FORK}/version/${SS14_VERSION}/file/SS14.Server_linux-x64.zip

# Unzip the downloaded file
RUN unzip SS14.Server_linux-x64.zip -d /server

RUN chmod +x /server/Robust.Server

CMD ["/server/Robust.Server"]
