#!/bin/bash

if diff -u <(USER=nobody DOMAIN=example.com ./templater.sh examples/vhost-php.tpl.conf) examples/vhost-php.conf; then
    echo OK
else
    echo Differences found
    exit 1
fi
