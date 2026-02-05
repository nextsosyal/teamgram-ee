#!/usr/bin/env bash
SERVICE=${1:-all}
TEAMGRAMIO="/opt/data/teamgram/src/teamgram.io"

if [ "$SERVICE" = "all" ]; then
    cd ${TEAMGRAMIO}/enterprise
    make idgen dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver poll scheduledmessage scheduled historyttl notify status
    cd ${TEAMGRAMIO}/teamcalls-server
    make sfu phone bff biz
elif [ "$SERVICE" = "sfu" ] || [ "$SERVICE" = "phone" ] || [ "$SERVICE" = "bff" ] || [ "$SERVICE" = "biz" ]; then
    cd ${TEAMGRAMIO}/teamcalls-server
    make $SERVICE
else
    cd ${TEAMGRAMIO}/enterprise
    make $SERVICE
fi
