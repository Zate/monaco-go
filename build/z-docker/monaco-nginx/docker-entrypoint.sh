#!/bin/sh
set -e

if [ "$1" != 'nginx' ]; then
	# exec gosu redis "$@"
	exec "$@"
fi

exec nginx
