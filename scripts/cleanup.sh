#!/bin/bash

apk del --purge bash build-base \
  && rm -rf /var/cache/apk/* /tmp/* /usr/share/man
