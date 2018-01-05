bash-bootstrap
===================

This is basic bootstrapping for bash.  It provides the following:

1. Common aliases
2. Tweaking for vim
3. Vim plugin management via [vim-bootstrap](https://github.com/jsdevel/vim-bootstrap).
4. A way to share these settings across machines with ease.

The bootstrapping allows ways for you to customize your environment.  See [Customizing](#customizing).

## Installing
### Prerequisites

Ensure you have the following packages installed:

* `vim`
* `git`
* `cmake`
* `python`

Once that's ready simply copy and run this command in a bash prompt:

```bash
curl -sk https://raw.githubusercontent.com/jsdevel/bash-bootstrap/master/bootstrap.bash | bash
```

### Excluding vim-bootstrap

By default `vim-bootstrap` is installed.  If you would like to avoid this, prefix the
install command with `BASH_BOOTSTRAP_NO_VIM=true <install command>`.  You can re-enable
`vim-bootrap` later by modifying your `~/.bashrc` file.

## Tested environments
These environments are known to support bash-bootstrap:

1. macbook pro
2. Fedora 20 LXDE
3. Fedora 20 Gnome 3

## Customizing

These are ways to allow bash-bootstrap to coexist with your existing setup:

1. For your aliases, you can create `~/.bash_aliases_custom`.

## Contrubuting
If you have reusable schtuff that you feel the world could benefit from please issue
a pull request!

## LICENSE

``````
The MIT License (MIT)

Copyright (c) 2013 Joseph Spencer

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
``````
