#!/usr/bin/env bash

echo "run idgen ..."
nohup ./idgen -f=../etc2/idgen.yaml >> ../logs/idgen.log  2>&1 &
sleep 1

echo "run status ..."
nohup ./status -f=../etc2/status.yaml >> ../logs/status.log  2>&1 &
sleep 1

echo "run authsession ..."
nohup ./authsession -f=../etc2/authsession.yaml >> ../logs/authsession.log  2>&1 &
sleep 1

echo "run dfs ..."
nohup ./dfs -f=../etc2/dfs.yaml >> ../logs/dfs.log  2>&1 &
sleep 1

echo "run media ..."
nohup ./media -f=../etc2/media.yaml >> ../logs/media.log  2>&1 &
sleep 1

echo "run biz ..."
nohup ./biz -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/biz.yaml >> ../logs/biz.log  2>&1 &
sleep 1

echo "run msg ..."
nohup ./msg -f=../etc2/msg2.yaml >> ../logs/msg.log  2>&1 &
sleep 1

echo "run sync ..."
nohup ./sync -f=../etc2/sync.yaml >> ../logs/sync.log  2>&1 &
sleep 1

echo "run sfu ..."
nohup ./sfu -f=../etc2/sfu.yaml >> ../logs/sfu.log  2>&1 &
sleep 1

echo "run phone ..."
nohup ./phone -f=../etc2/phone.yaml >> ../logs/phone.log  2>&1 &
sleep 1

echo "run bff ..."
nohup ./bff -predefined=false -predefined2=false -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/bff.yaml >> ../logs/bff.log  2>&1 &
sleep 5

echo "run session ..."
nohup ./session -f=../etc2/session-phone.yaml >> ../logs/session.log  2>&1 &
sleep 1

echo "run gateway ..."
#nohup ./gateway -f=../etc/gateway.yaml >> ../logs/gateway.log  2>&1 &
GNET_LOGGING_LEVEL=-1 nohup ./gnetway -f=../etc2/gnetway.yaml >> ../logs/gnetway.log 2>&1 &
sleep 1

echo "run turnserver ..."
turnserver -v -r 192.168.10.150:3478 -a -o -c ../etc2/turnserver.conf --log-file ../logs/turnserver.log