#!/usr/bin/env bash

TEAMGRAMIO="/opt/data/teamgram/src/teamgram.io"

cd ${TEAMGRAMIO}/enterprise
make idgen dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver poll scheduledmessage scheduled historyttl notify status apiserver

cd ${TEAMGRAMIO}/teamcalls-server
make sfu phone bff biz
