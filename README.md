# dotfiles
I'm a bit worried about what to store on here and what not to. I'm constantly uninstalling and installing applications. Should I put a certain files config files in here? Should I just copy all of .config in here? idk.

Those are the same issues I was/am having with my [install script](https://gist.github.com/thepaperpilot/eeeb616bc457c01e6c62) (private because WIP, and personal)

Eventually I'll probably move that gist into this repo, and only put config files in here for programs installed by that script. I'll also probably store my ~/bin/ scripts in here.

But I put some basic ones in here. Install by running `install.sh` (remember to `chmod +x` first). It'll create symlinks putting the files, which are still here, where they need to go. It uses the current home directory as a reference point, so make sure to be the correct user when running the script.

By default the script will NOT overwrite existing files, but will if you pass it the "-overwrite" flag

Also I'm not sure what to do if an application decides to overwrite a file, and breaks the symlink. I guess you'll just have to manually re-update it using the script. I hope I'm not doing this the wrong way or something.
