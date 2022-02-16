# Local Setup

## Introduction

This repository describes the setup of your local machine. You can use it on a windows or unix based system. It was tested on Windows 11 and Ubuntu 20.04. LTS.

## Prerequisites

### Windows

You have to do some manual steps to prepare your Windows installation. Please install the following on your machine:

- wsl2 installed (https://docs.microsoft.com/de-de/windows/wsl/install)
- Ubuntu installed as subsystem (preferred 20.04 LTS)
- docker installed with wsl 2 backend (https://docs.docker.com/desktop/windows/install/)

### Ubuntu

- no specific requirements ;)

## Tools

- zsh (https://zsh.sourceforge.io/)
    - oh-my-zsh (https://github.com/ohmyzsh/ohmyzsh)
    - antibody (https://getantibody.github.io/)
- aws cli (https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
- azure cli (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- sdkman (https://sdkman.io/)

## Installation

```bash
./install.sh
```
