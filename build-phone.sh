#!/usr/bin/env bash


GITHUB="/opt/data/teamgram/src/github.com"
TEAMGRAMIO="/opt/data/teamgram/src/teamgram.io"

cd ${GITHUB}/teamgram/teamgram-server
make -f Makefile.teamgram idgen status dfs media authsession msg sync session gnetway admin

cd ${TEAMGRAMIO}/teamcalls-server
make sfu phone bff biz
