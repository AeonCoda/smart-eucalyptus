#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5dc52e343ffbee001a2cc4ee/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5dc52e343ffbee001a2cc4ee
curl -s -X POST https://api.stackbit.com/project/5dc52e343ffbee001a2cc4ee/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5dc52e343ffbee001a2cc4ee/webhook/build/publish > /dev/null
