bash-bootstrap
===================
This is basic bootstrapping for bash.  It provides the following:

1. Common aliases
2. Tweaking for vim
3. Vim plugin management
4. A way to share these settings across machines with ease.

The bootstrapping allows ways for you to customize your environment.  See customizing
below.

Out of the box, you'll have the following vim plugins configured:

* snipmate
* syntastic
* nerdtree

##Installing
Prior to installing bash-bootstrap, vim and git need to be available in your $PATH.

Once that's ready simply copy and run this command in a
bash prompt:

`curl -3s https://raw.githubusercontent.com/jsdevel/bash-bootstrap/master/bootstrap.bash > /tmp/bash-bootstrap;bash /tmp/bash-bootstrap;. ~/.bash_profile;rm /tmp/bash-bootstrap`

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
