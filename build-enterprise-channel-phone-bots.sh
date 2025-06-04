#!/usr/bin/env bash

TEAMGRAMIO="$GOPATH/src/teamgram.io"

cd ${TEAMGRAMIO}/enterprise
make idgen dfs media authsession twofa webpage msg inbox push sync session gnetway wsserver poll scheduledmessage httpserver

cd ${TEAMGRAMIO}/channels
make adminlog channelsync scheduled historyttl channelmsg channelinbox notify status

cd ${TEAMGRAMIO}/teamcalls-server
make sfu

cd ${TEAMGRAMIO}/channelcalls
make phone

cd ${TEAMGRAMIO}/stories
make bff biz storyq

cd ${TEAMGRAMIO}/bots
make botsync botfather bots botway gif
