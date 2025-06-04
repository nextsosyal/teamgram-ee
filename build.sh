#!/usr/bin/env bash

#TEAMGRAMIO="$GOPATH/src/teamgram.io"
TEAMGRAMIO="/Users/wubenqi/go/src/teamgram.io"

echo ${TEAMGRAMIO}
cd ${TEAMGRAMIO}/enterprise
make idgen dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver poll scheduledmessage httpserver

cd ${TEAMGRAMIO}/channels
make adminlog channelsync scheduled historyttl channelmsg channelinbox notify status

cd ${TEAMGRAMIO}/teamcalls-server
make sfu

cd ${TEAMGRAMIO}/channelcalls
make phone

cd ${TEAMGRAMIO}/stories
make bff biz storyq storygc

cd ${TEAMGRAMIO}/bots
make botsync botfather bots botway gif

cd ${TEAMGRAMIO}/miniapp
make

cd ${TEAMGRAMIO}/premium
make

cd ${TEAMGRAMIO}/business
make

cd ${TEAMGRAMIO}/translation
make
