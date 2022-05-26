FROM python:3.8-slim-buster

RUN mkdir /powershell

RUN apt-get install -y wget apt-transport-https software-properties-common

WORKDIR /app

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    apt-get update && \
    apt-get install -y powershell

RUN ["pwsh", "-command" ,"$psversiontable"]
