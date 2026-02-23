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

## Ansible setup management

