bash-bootstrap
===================
This is basic bootstrapping for bash.  It provides the following:

1. Common aliases
2. Tweaking for vim
3. Vim plugin management
4. A way to share these settings across machines with ease.

The bootstrapping allows ways for you to customize your environment.  See customizing
below.

##Installing
Before installing, you'll need vim and git installed and available in your $PATH.

Once git and vim are installed on your path, simply copy and run this command in a
bash prompt:
`curl -s https://raw.githubusercontent.com/jsdevel/bash-bootstrap/master/bootstrap.bash > /tmp/bash-bootstrap;bash /tmp/bash-bootstrap;. ~/.bashrc;rm /tmp/bash-bootstrap`

##Tested environments
These environments are known to support bash-bootstrap:
1. macbook pro
2. Fedora 20 LXDE
3. Fedora 20 Gnome 3

##Customizing
These are ways to allow bash-bootstrap to coexist with your existing setup:
1. For your aliases, you can create `~/.bash_aliases_custom`.

##Contrubuting
If you have reusable schtuff that you feel the world could benefit from please issue
a pull request!
