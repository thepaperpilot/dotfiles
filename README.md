# dotfiles
I'm a bit worried about what to store on here and what not to. I'm constantly uninstalling and installing applications. Should I put a certain files config files in here? Should I just copy all of .config in here? idk.

Those are the same issues I was/am having with my [install script](https://gist.github.com/thepaperpilot/eeeb616bc457c01e6c62) (private because WIP, and personal)

Eventually I'll probably move that gist into this repo, and only put config files in here for programs installed by that script. I'll also probably store my ~/bin/ scripts in here.

But I put some basic ones in here. Install by running `bash run.sh`. It'll create symlinks putting the files, which are still here, where they need to go. It uses the current home directory as a reference point, so make sure to be the correct user when running the script.

The script will make a backup of all the user's files and put them in ~/.backup/
