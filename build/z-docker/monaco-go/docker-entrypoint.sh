#!/bin/sh
set -e

if [ "$1" != 'nginx' ]; then
	# exec gosu redis "$@"
	exec "$@"
fi
cd /opt/monaco-go
exec npm run serve
