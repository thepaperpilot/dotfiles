# dotfiles

I wouldn't use this, as I plan on abstracting it a lot- and re-focus it on just the config files. I was trying to make a script that does everything, but I now realize- for security reasons- there are several things that should be done manually, or at least not automated somewhere public/online at all.

To create the symbolic links to the various config files, run `config.sh`

If you'd like to set up your ec2 instance create an identity file and put it in you `~/.ssh` folder, then run this:

```bash
ssh-keyscan -H ec2-52-43-183-109.us-west-2.compute.amazonaws.com >> ~/.ssh/known_hosts
ssh ec2 mkdir -p .terminfo/r
scp /usr/share/terminfo/r/rxvt-unicode* ec2:.terminfo/r/
```

The list of applications I use is in `packages.list`. Getting the sources for these and the package manager correct is up to the user. In addition, I like to install `steam`, but do so manually because it prompts a user agreement that I couldn't automate. In the file there is an empty line. The first section are programs I use, the second section are for dependencies for the manually installed programs I use. On other systems those may not be needed, or maybe more will be needed.

On Ubuntu I added these PPAs:

```bash
sudo add-apt-repository -y ppa:webupd8team/atom
sudo add-apt-repository -y ppa:mozillateam/firefox-next
sudo add-apt-repository -y ppa:numix/ppa
sudo apt-add-repository -y ppa:tista/adapta
```

I use some atom packages, as listed in `atom.list`, which can be installed using `apm`.

Some applications I needed to install manually, so I did. Look in manual.md for how to do that.

If you're using dconf you can set some preferences by running `dconf.sh`

If you want to stop typing your root password in all the time, you could run this:

```bash
sudo grep -q -F 'anthony ALL=(ALL) NOPASSWD:ALL' /etc/sudoers || echo 'anthony ALL=(ALL) NOPASSWD:ALL' | sudo tee -a /etc/sudoers
```

Also make sure to [set up your VPN](https://support.ipvanish.com/customer/portal/articles/1978292-openvpn-ubuntu-networkmanager)

Also install the binary version of the lastpass extension
