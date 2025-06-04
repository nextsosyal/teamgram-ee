#!/usr/bin/env bash

TEAMGRAMIO="$GOPATH/src/teamgram.io"

cd ${TEAMGRAMIO}/enterprise
make -f Makefile.Linux idgen status dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver historyttl poll scheduledmessage

cd ${TEAMGRAMIO}/channels
make -f Makefile.Linux adminlog channelsync channelmsg bff scheduled

cd ${TEAMGRAMIO}/teamcalls-server
make -f Makefile.Linux sfu biz

cd ${TEAMGRAMIO}/channelcalls
make -f Makefile.Linux phone

cd ${TEAMGRAMIO}/bots
make -f Makefile.Linux botsync botfather bots botway gif
