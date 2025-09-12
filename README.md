My Arch Linux Dotfiles
======================

This repository contains my personal configuration files (dotfiles) for my Arch Linux setup, managed with a set of simple shell scripts. The goal is to be able to set up a new machine quickly and keep existing ones synchronized.

🚀 Fresh Installation
---------------------

To set up a new Arch Linux machine from scratch, run the following command in your terminal. This will automatically download and execute the bootstrap script, which installs Git, clones this repository, and runs the main installer.

    curl -L "https://raw.githubusercontent.com/ArashSameni/dotfiles/master/bootstrap.sh" | bash
    

📂 Repository Structure
-----------------------

This repository is organized into a few key components to keep things clean and modular:

*   `bootstrap.sh`: The initial script for a new machine. Its only job is to install Git and clone this repository.
    
*   `install.sh`: The main task runner. It executes scripts from the `tasks/` directory to install software like Hyprland, Neovim, etc.
    
*   `sync.sh`: The dotfile manager. It copies all configurations from the `home/` directory to your actual `$HOME` directory.
    
*   `home/`: This directory contains the actual dotfiles and configuration directories (like `.zshrc` and `.config/`) that will be copied to your system.
    
*   `tasks/`: This directory holds all the small, modular scripts for installing specific applications or tools. They are executed by the `install.sh` script.
    

🛠️ Usage After Installation
----------------------------

Once the initial bootstrap is complete, you can use the scripts within the repository to manage your system.

#### Running a Specific Installation Task

You can run the installer and pass a filter to only execute specific tasks. For example, to only run the Neovim setup:

    ./install.sh neovim
    

#### Synchronizing Your Dotfiles

If you pull changes from this repository and want to apply the latest configurations to your machine, just run the `sync.sh` script:

    ./sync.sh
    

🎨 Customization
----------------

Feel free to fork this repository and customize it to your needs. You can easily:

*   Add new installation scripts to the `tasks/` directory.
    
*   Modify the configurations in the `home/` directory.
    
*   Update the `bootstrap.sh` script with your own GitHub username.
