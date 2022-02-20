# Local Setup

## Introduction

This repository describes the setup of your local machine. You can use it on a windows or unix based system. It was tested on Windows 11 and Ubuntu 20.04. LTS.

## Prerequisites

### Windows

You have to do some manual steps to prepare your Windows installation. Please install the following on your machine:

- wsl2 installed (https://docs.microsoft.com/de-de/windows/wsl/install)
- Ubuntu installed as subsystem (preferred 20.04 LTS)
- docker installed with wsl 2 backend (https://docs.docker.com/desktop/windows/install/)

### Ubuntu / Windows-Subsystem

- root access

## Tools / Libraries

In this section are the general tools which can be installed either in plain ubuntu or the wsl. Some tools like docker will not be installed by this script, because on Windows you can use the docker desktop with the wsl backend. In this case, the installation will not be triggered by the wsl. In Ubuntu you can trigger the installation directly from your bash. 

- zsh (https://zsh.sourceforge.io/)
    - oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
    - antibody (https://getantibody.github.io/)
- aws cli (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- aws cdk (https://docs.aws.amazon.com/cdk/v2/guide/home.html)
- azure cli (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- sdkman (https://sdkman.io/)
- taskfile (https://taskfile.dev/#/)
- node/npm (https://nodejs.org/en/, https://nodejs.org/en/)
- jq (https://stedolan.github.io/jq/)
- golang (https://go.dev/)
- python3 (https://www.python.org/)
- tldr (https://tldr.sh/)

### Installation

Use the following command to start the installation:

```shell
sudo ./install.sh
```

This will start the installation of all tools from the section before on your local machine. Furthermore, it will update all dependencies on your system beforehand. The output should look like:

```shell
azure...installed.
aws...installed.
sdkman...installed.
zsh...installed.
update system....done
```

If you forgot to start the command with `sudo` an error will occur:

```shell
./install.sh is not running as root. Try using sudo.
```

## Local Development Tools

- IntelliJ Ultimate (https://www.jetbrains.com/de-de/idea/)
- Visual Studio Code (https://code.visualstudio.com/)
- Google Chrome (https://www.google.com/intl/de_de/chrome/)
- Docker Desktop (https://www.docker.com/products/docker-desktop) only on Windows
- NoSQL Workbench for DynamoDB (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/workbench.html)