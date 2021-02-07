#!/bin/bash

set -e
exec /usr/sbin/httpd -D FOREGROUND
