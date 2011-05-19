This provides a base Vagrant+Chef Solo for local development.

## Getting Started

1. Install VirtualBox.
2. Get a copy of the repo.

        git clone git://github.com/wfarr/cs2200-base.git

3. Install Vagrant

        gem install vagrant
        vagrant box add lucid64 http://files.vagrantup.com/lucid64.box

4. Create a VM

        vagrant up
        vagrant ssh

## Using the VM

All directories named either hw* or project* will be available in the ~vagrant directory. These are linked to your local filesystem, which allows you to work with the code in your local editor and run it against the assembler via the virtual machine.

Customize the Vagrantfile to change things like the amount of memory allocated to the VM (currently 512MB).

When you want to shut down the VM, you can do:

    vagrant halt

If you modify cookbooks and wish to re-configure an exisiting instance, you may:

    vagrant provision

To shut down and remove a VM, use:

    vagrant destroy

To create a new VM or boot an existing CS 2200 VM:

    vagrant up
