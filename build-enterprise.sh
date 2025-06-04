#!/usr/bin/env bash

TEAMGRAMIO="$GOPATH/src/teamgram.io"

cd ${TEAMGRAMIO}/enterprise
make idgen dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver poll scheduledmessage bff scheduled historyttl notify status biz
