# docker-attic

Usage: 

    $ docker run --rm tanel/attic -h
    usage: attic [-h]
                 {serve,init,check,change-passphrase,create,extract,delete,list,mount,info,prune,help}
                 ...

    Attic 0.16 - Deduplicated Backups

    optional arguments:
      -h, --help            show this help message and exit

    Available commands:
      {serve,init,check,change-passphrase,create,extract,delete,list,mount,info,prune,help}


In action:

    $ docker run --rm -v /:/host:ro -v /tmp/repo:/data -v ${HOME}/.docker/.cache/attic:/root/.cache/attic tanel/attic init /data
    Initializing repository at "/data"
    Encryption NOT enabled.
    Use the "--encryption=passphrase|keyfile" to enable encryption.
    Initializing cache...

    $ docker run --rm -v /:/host:ro -v /tmp/repo:/data -v ${HOME}/.docker/.cache/attic:/root/.cache/attic tanel/attic create -v /data::first-backup /host/tmp/123/
    /host/tmp/123
    /host/tmp/123/file
    /host/tmp/123/file1
    /host/tmp/123/file2
    /host/tmp/123/file3

    $ docker run --rm -v /:/host:ro -v /tmp/repo:/data -v ${HOME}/.docker/.cache/attic:/root/.cache/attic tanel/attic list /data
    first-backup                         Tue Sep  4 10:04:37 2017
