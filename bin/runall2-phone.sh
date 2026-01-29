#!/usr/bin/env bash

echo "run idgen ..."
nohup ./idgen -f=../etc/idgen.yaml >> ../logs/idgen.log  2>&1 &
sleep 1

echo "run status ..."
nohup ./status -f=../etc/status.yaml >> ../logs/status.log  2>&1 &
sleep 1

echo "run authsession ..."
nohup ./authsession -f=../etc/authsession.yaml >> ../logs/authsession.log  2>&1 &
sleep 1

echo "run dfs ..."
nohup ./dfs -f=../etc/dfs.yaml >> ../logs/dfs.log  2>&1 &
sleep 1

echo "run media ..."
nohup ./media -f=../etc/media.yaml >> ../logs/media.log  2>&1 &
sleep 1

echo "run biz ..."
nohup ./biz -app_name="Tekir" -t.me="tekir.app" -site_name="tekir.app" -f=../etc/biz.yaml >> ../logs/biz.log  2>&1 &
sleep 1

echo "run msg ..."
nohup ./msg -f=../etc/msg2.yaml >> ../logs/msg.log  2>&1 &
sleep 1

echo "run sync ..."
nohup ./sync -f=../etc/sync.yaml >> ../logs/sync.log  2>&1 &
sleep 1

echo "run sfu ..."
nohup ./sfu -f=../etc/sfu.yaml >> ../logs/sfu.log  2>&1 &
sleep 1

echo "run phone ..."
nohup ./phone -f=../etc/phone.yaml >> ../logs/phone.log  2>&1 &
sleep 1

echo "run bff ..."
nohup ./bff -predefined=false -predefined2=false -app_name="Tekir" -t.me="tekir.app" -site_name="tekir.app" -f=../etc/bff.yaml >> ../logs/bff.log  2>&1 &
sleep 5

echo "run session ..."
nohup ./session -f=../etc/session-phone.yaml >> ../logs/session.log  2>&1 &
sleep 1

echo "run gateway ..."
#nohup ./gateway -f=../etc/gateway.yaml >> ../logs/gateway.log  2>&1 &
GNET_LOGGING_LEVEL=-1 nohup ./gnetway -f=../etc/gnetway.yaml >> ../logs/gnetway.log 2>&1 &
sleep 1
