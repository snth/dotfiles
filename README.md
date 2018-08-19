# dotfiles

I now manage my dotfiles with [vcsh](https://github.com/RichiH/vcsh) and
[myrepos](https://github.com/RichiH/myrepos).

## Prerequisites

In order for the steps below to work effectively, we need to have password-less
authentication to our repository server set up.

### Generate a new SSH key

    ssh-keygen -t rsa -C "your_email@example.com"

### Adding an SSH key to your gitserver account

Windows

    cd %userprofile%/.ssh
    clip < id_rsa.pub

Linux

    sudo apt install xclip
    xclip -sel clip < ~/.ssh/id_rsa.pub

Then navigate to _gitserver_ and go to "Add SSH key" under your profile and
then paste the clipboard contents.

## vcsh

### Overview

The basic idea is to have different bare repositories for each application
whose configuration you would like to manage and then to check these out into
the home directory where the dotfiles need to live. However you also need to
manage all the .gitignore files since repo needs to ignore the files of all the
other repos.

[vcsh](https://github.com/RichiH/vcsh) simplifies all of this and then provides
a git interface right in the $HOME directory.

### Tutorial

The article [Manage Your Configs with vcsh](
https://www.linuxjournal.com/content/manage-your-configs-vcsh) does a good job
of introducing the `vcsh` and `mr` commands.

### Installation

    sudo apt install vcsh

### Setup

When setting up a new vcsh repo to track for example vim files you do the
following:

    cd ~
    vcsh init vim
    vcsh vim add .vimrc
    vcsh vim commit -m "Adds .vimrc file"
    vcsh vim remote add origin git@gitserver:vim.git
    vcsh vim push -u origin master

As you can see, the api is the same as git except that you use `vcsh vim`
instead of `git` for each command.

### Entering and exiting vcsh environments

If you are going to work with only one particular set of configuration files
you can enter a **vcsh environment** akin to a python virtualenv or cona
environment. You enter a vcsh environment with `vcsh enter <environment name>`
and exit simply with `exit`. Using this the steps above would look as follows:

    cd ~
    vcsh init vim
    vcsh enter vim
    git add .vimrc
    git commit -m "Adds .vimrc file"
    git remote add origin git@gitserver:vcsh-vim.git
    git push -u origin master
    exit

### Deploy your configuration to another machine

    sudo apt install git vcsh

    vcsh enter vim
    git remote add origin git@gitserver:vcsh-vim.git
    git pull -u origin master

or

    vcsh clone git@gitserver:vcsh-vim.git vim

### Multiple vcsh repositiories

You can repeat the steps above for multiple repositories, for example for bash,
git, vim, tmux, powerline, ...

This process works but becomes a bit tedious after a while. To automate this
for multiple repos we use the next tool.

## myrepos

### Overview

The [myrepos](https://github.com/RichiH/myrepos) tool is available on Ubuntu
through the `mr` command. It allows us to easily manage multiple vcsh repos and
update them all at once.

### Installation

    sudo apt install mr

### Setup

The easiest way to get started is to clone the repo template provided by the
creator of vcsh and myrepos:

    vcsh clone https://github.com/richih/vcsh_mr_template.git mr

The control files for `mr` live in `~/.config/mr/available.d` so go to that
directory and modify the files there:

    cd ~/.config/mr/available.d
    vim vim.vcsh

Once you've made your changes we need to commit them and push these to a new
repo:

    vcsh enter mr
    cd ~/.config
    git add mr
    git commit -m "Adds mr configuration"
    git remote rm origin
    git remote add origin git@gitserver:vcsh-mr.git
    git push -u origin master
    exit

### Deploying to a new machine

    sudo apt install git vcsh mr
    vcsh clone git@gitserver:vcsh-mr.git mr
    mr up

That's it! Those three simple lines are all that we need to all of our
configurations deployed to a new machine.
