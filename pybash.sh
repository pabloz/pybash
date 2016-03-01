#!/usr/bin/env bash

__imp () {
    cat <<EOF
from inspect import *
from importlib import import_module
module_path="$1"
try:
    import $1 as module
    obj = module
except ImportError:
    module_path, attr = module_path.rsplit('.', 1)
    module = import_module(module_path)
    obj = getattr(module, attr)
EOF
    [[ -n $2 ]] && echo "print($2(obj))"
}

pywich () {
    p=$(which python)
    [[ -n $1 ]] && $p -c "$( __imp $1 getsourcefile )" || echo $p;
}

pylib () {
    python -c "from distutils.sysconfig import get_python_lib;print(get_python_lib())";
}

pycd () {
    cd $( [[ -z $1 ]] && pylib || m=$(pywich $1) && readlink -m $m/../ );
}

pycat () {
    for m; do
        python -c "$( __imp $m getsource )";
    done
}
