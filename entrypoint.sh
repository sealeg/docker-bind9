#!/bin/bash
set -e

if [ -z "$1" ]; then
    config_dir=/config
    if [ ! -d "$config_dir" ]; then
        printf '%s dir is not present.\n' $config_dir

        exit 1
    fi
    conf="$config_dir/named.conf"
    if [ ! -r $conf ]; then
        printf '%s is not readable.\n' $conf

        exit 1
    fi

    # check config. Will exit docker run on failure
    /usr/sbin/named-checkconf -z "$conf"

    exec /usr/sbin/named -4 -f \
        -c "$conf" \
        -u named
else
    exec "$@"
fi
