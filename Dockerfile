FROM python:3.8-slim-buster

RUN mkdir /powershell

RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget curl apt-transport-https software-properties-common

WORKDIR /app

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell

WORKDIR /powershell
COPY download_powershell_releases.ps1 download_powershell_releases.ps1

### Modules region

RUN pwsh -c Install-Module ImportExcel -Force

### Modules region




#RUN pwsh -f download_powershell_releases.ps1
RUN ["pwsh", "-command" ,"$env:PSModulePath.Split(':')"]
