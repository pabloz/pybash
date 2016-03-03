# pybash

## Bash functions to work with Python modules

:warning: Work in progress: Half-tested, only on Python 2.7 / Ubuntu. Expect tracebacks.

May not work for you at this point, and there may be something better already
available out there.

Feedback is welcome.


### How:

Load it with `source path/to/pybash.sh`.
E.g. to have it available when starting a terminal:

    $ echo source ~/code/pybash/pybash.sh >> ~/.bashrc


#### pywich

Usage: `pywich [module.or.object]`

Prints the location of the file that defines the given arguments, e.g.:

    $ pywich __future__
    /usr/lib/python2.7/__future__.py


Without arguments, prints the path to the executable, e.g.:

    $ pywich 
    /usr/bin/python


#### pycd

Usage: `pycd [module.or.object]`

Changes to the directory containing the given argument, e.g.:

    pabloz@PEQL:~$ pycd xml.parsers.expat  # (or xml.parsers, same)
    pabloz@PEQL:/usr/lib/python2.7/xml/parsers$ 

Without arguments, it goes to the location of the third-party packages library,
typically dist-packages:

    pabloz@PEQL:~$ pycd
    pabloz@PEQL:/usr/lib/python2.7/dist-packages$ 


#### pycat

Usage: `pycat module.or.object ...`

Prints the source code of the requested object, e.g.:

    $ pycat os.path.realpath os.path.abspath
    def realpath(filename):
        """Return the canonical path of the specified filename, eliminating any
    symbolic links encountered in the path."""
        path, ok = _joinrealpath('', filename, {})
        return abspath(path)
    
    def abspath(path):
        """Return an absolute path."""
        if not isabs(path):
            if isinstance(path, _unicode):
                cwd = os.getcwdu()
            else:
                cwd = os.getcwd()
            path = join(cwd, path)
        return normpath(path)


#### pylib

Prints out the location of the third-party packages library, typically
dist-packages:

    $ pylib 
    /usr/lib/python2.7/dist-packages
