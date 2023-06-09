# miniconda-windows-template

This repository acts as initial boiler plate for setting up a Miniconda driven Python development environment.

## Setup

### Prerequisites

- A bash terminal, Git Bash or other.

### Install Miniconda

1. Download a Python 10 variant of Miniconda from this [link](https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Windows-x86_64.exe).
2. Open the downloaded .exe file.
3. Follow the installation instructions:
    1. Screen one: "Next"
    2. Screen two: "Agree"
    3. Screen three: "Next"
    4. Screen four: "Next"
    5. Screen five: Select the checkbox to add Miniconda to the PATH and click "install"
    6. Screen six: "Next"
    7. Screen seven: "Install"

### Setup Miniconda Environment

1. Open a bash terminal (Git Bash or other).
2. Ensure your current working directory is in the repository root folder.
3. Execute the command ``. setup-env.sh``

You will now have an activated virtual environment in your terminal. To deactivate your environment use the command ``conda deactivate``

To remove the environment entirely use ```conda env remove --name dev_env```

## Appendix

### FAQ

#### Q1
Why are you using ``source activate dev_env`` and not ``conda activate dev_env`` in your setup.sh script? 

#### A1
I got this error - ```CommandNotFoundError: Your shell has not been properly configured to use 'conda activate'.
If using 'conda activate' from a batch script, change your
invocation to 'CALL conda.bat activate'.```. I felt simply using ```source``` as I have done in the past was a touch cleaner and acts a non intrusive subsitute. 

#### Q2
Why did you remove/change some of the package versions?

#### A2
Several sub dependency conflicts prevented the environment build, e.g.

```
Package pathlib2 conflicts for:
sqlalchemy=1.4.39 -> importlib-metadata -> pathlib2
jupyterlab=3.6.1 -> ipython -> pathlib2
```

The Conda depedency resolver, in its default configuration did not demonstrate the agility on Windows to solve the conflicts. 

I also slimlined the environment to essentials for ease of debugging, we can add more dependencies incrementally as needed. To do so, install the package without a version and use ``conda list`` to get the package version that satistifies Conda before adding it to ``env.yml``.

### Original Repository Intent

The original goal of this template repository was to encapsulate the entire setup into a single script. From the installation of Miniconda into the Windows operating system to the eventual activation of a development-ready virtual environment. This ambition was causing problems, particularly during the installation of Miniconda. Attempts at scripting an approach to perform this task are shown below.

 #### Attempt 1 - setup.bat

```
curl -O https://repo.anaconda.com/miniconda/Miniconda-latest-Windows-x86_64.exe
mkdir %UserProfile%\Miniconda3
start /w "" %~dp0Miniconda-latest-Windows-x86_64.exe /InstallationType=JustMe /RegisterPython=0 /S /D=%UserProfile%\Miniconda3
```

 #### Attempt 2 - setup.sh

```
curl --output Miniconda-latest-Windows-x86_64.exe --url https://repo.anaconda.com/miniconda/Miniconda-latest-Windows-x86_64.exe
mkdir "C:\Program Files\Miniconda3"
Start-Process Miniconda-latest-Windows-x86_64.exe -Wait -ArgumentList @('/S', '/InstallationType=JustMe', '/RegisterPython=0', "/D=C:\Program Files\Miniconda3")
```
