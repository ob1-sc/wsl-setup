# tanzu-wsl-setup
Basic Windows Subsystem for Linux 2 setup for Tanzu platform engineers and operators.

## Install WSL2

The quickest way to install WSL2 is through an elevated terminal (PowerShell or Command Prompt).

Right-click the Start button and select Terminal (Admin) or PowerShell (Admin).

Type the following command:

```PowerShell
wsl --install Ubuntu-24.04
```

By default, `--install` grabs Ubuntu (latest). If you want a different flavor of Linux, you can see what is available first:

List available distros: `wsl --list --online`

Install a specific one: `wsl --install -d <DistroName>` (e.g., `wsl --install -d Debian`)

Restart your computer. This is a non-negotiable step to initialize the virtual machine platform IF the virtual machine platform has not yet been initialized.

## Resource management
WSL will consume unlimited resources in windows unless instructed otherwise. Copy `.wsl-setup` into your `%userprofile%` directory on windows and tweak the settings as approriate.

## Ansible setup

Note, these steps are subject to change as python/pip/pipx/ansible like to change how best they should be installed. I have documented the steps for Ubuntu 24.04 as of Feb 2026.

### Update and Install System Dependencies
First, ensure your system is up to date and install the necessary Python environment headers and pipx.

```Bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y python3-pip python3-venv pipx
```

### Configure Your Path
You need to ensure that the directory where pipx will stores binaries (~/.local/bin) is in your shell's $PATH.

The easiest way to do this is to:
1) create the `~/.local/bin` directory: `mkdir -p ~/.local/bin`
1) restart your shell, this will ensure your `~/.profile` is reloaded which will add the local bin to the path

### Install Ansible

There are two common packages you can install:

`ansible`: The "batteries-included" version containing the core engine plus a massive collection of community modules.

`ansible-core`: The lightweight version containing only the base engine and built-in plugins.

For most users, the full package is preferred:

```Bash
pipx install --include-deps ansible
```
Why `--include-deps`? This ensures that all required Python dependencies are bundled within the isolated environment, preventing future conflicts with system-level updates.

### Install additional packages

The ansible playbook we will be using to setup the tanzu platform tooling requires `jmespath` to be available. 

To install `jmespath`:

```Bash
pipx install --include-deps jmespath
```

To make `jmespath` available to `ansible`:

```Bash
pipx inject ansible jmespath
```

### Verify the installation

To verify we are using the correct ansible version, we can run:

```Bash
which ansible
```
This should return the path to ansible under `/home/<user>/.local/bin/ansible`
