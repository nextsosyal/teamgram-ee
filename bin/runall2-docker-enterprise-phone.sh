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

echo "run poll ..."
nohup ./poll -f=../etc2/poll.yaml >> ../logs/poll.log  2>&1 &
sleep 1

echo "run twofa ..."
nohup ./twofa -f=../etc2/twofa.yaml >> ../logs/twofa.log  2>&1 &
sleep 1

echo "run biz ..."
nohup ./biz -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/biz.yaml >> ../logs/biz.log  2>&1 &
sleep 1

echo "run notify ..."
nohup ./notify -f=../etc2/notify.yaml >> ../logs/notify.log  2>&1 &
sleep 1

echo "run webpage ..."
nohup ./webpage -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/webpage.yaml >> ../logs/webpage.log  2>&1 &
sleep 1

#echo "run adminlog ..."
#nohup ./adminlog -f=../etc2/adminlog.yaml >> ../logs/adminlog.log  2>&1 &
#sleep 1

echo "run inbox ..."
nohup ./inbox -f=../etc2/inbox.yaml >> ../logs/inbox.log 2>&1 &
sleep 1

echo "run msg ..."
nohup ./msg -f=../etc2/msg.yaml >> ../logs/msg.log  2>&1 &
sleep 1

#echo "run channelinbox ..."
#nohup ./channelinbox -f=../etc2/channelinbox.yaml >> ../logs/channelinbox.log  2>&1 &
#sleep 1

#echo "run channelmsg ..."
#nohup ./channelmsg -f=../etc2/channelmsg.yaml >> ../logs/channelmsg.log  2>&1 &
#nohup ./channelmsg -f=../etc2/channelmsg2.yaml >> ../logs/channelmsg.log  2>&1 &
#sleep 1

#echo "run channelmsg2 ..."
#nohup ./channelmsg2 -f=../etc2/channelmsg2.yaml >> ../logs/channelmsg2.log  2>&1 &
#sleep 1

echo "run scheduledmessage ..."
nohup ./scheduledmessage -f=../etc2/scheduledmessage.yaml >> ../logs/scheduledmessage.log  2>&1 &
sleep 1

echo "run sync ..."
nohup ./sync -f=../etc2/sync.yaml >> ../logs/sync.log  2>&1 &
sleep 1

#echo "run channelsync ..."
#nohup ./channelsync -f=../etc2/channelsync.yaml >> ../logs/channelsync.log  2>&1 &
#sleep 1

#echo "run botsync ..."
#nohup ./botsync -f=../etc2/botsync.yaml >> ../logs/botsync.log  2>&1 &
#sleep 1

echo "run scheduled ..."
nohup ./scheduled -f=../etc2/scheduled.yaml >> ../logs/scheduled.log  2>&1 &
sleep 1

echo "run push ..."
nohup ./push -f=../etc2/push.yaml >> ../logs/push.log  2>&1 &
sleep 1

echo "run sfu ..."
nohup ./sfu -f=../etc2/sfu.yaml >> ../logs/sfu.log  2>&1 &
sleep 1

#echo "run botfather ..."
#nohup ./botfather -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/botfather.yaml >> ../logs/botfather.log  2>&1 &
#sleep 1

#echo "run gif ..."
#nohup ./gif -f=../etc2/gif.yaml >> ../logs/gif.log  2>&1 &
#sleep 1

echo "run historyttl ..."
nohup ./historyttl -f=../etc2/historyttl.yaml >> ../logs/historyttl.log  2>&1 &
sleep 1

#echo "run bots ..."
#nohup ./bots -f=../etc2/bots.yaml >> ../logs/bots.log  2>&1 &
#sleep 1

echo "run phone ..."
nohup ./phone -f=../etc2/phone.yaml >> ../logs/phone.log  2>&1 &
sleep 1

echo "run bff ..."
nohup ./bff -predefined=false -predefined2=false -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc2/bff.yaml >> ../logs/bff.log  2>&1 &
sleep 5

echo "run session ..."
nohup ./session -f=../etc2/session-enterprise-phone.yaml >> ../logs/session.log  2>&1 &
sleep 1

echo "run gateway ..."
#nohup ./gateway -f=../etc2/gateway.yaml >> ../logs/gateway.log  2>&1 &
GNET_LOGGING_LEVEL=-1 nohup ./gnetway -f=../etc2/gnetway.yaml >> ../logs/gnetway.log 2>&1 &
sleep 1

#echo "run tgadmin ..."
#nohup ./tgadmin -f=../etc2/tgadmin.yaml >> ../logs/tgadmin.log  2>&1 &
#sleep 1

#echo "run tgme ..."
#nohup ./tgme -f=../etc2/tgme.yaml >> ../logs/tgme.log  2>&1 &
#sleep 1

#echo "run botway ..."
#nohup ./botway -f=../etc2/botway.yaml >> ../logs/botway.log  2>&1 &
#sleep 1

echo "run wsserver ..."
nohup ./wsserver -f=../etc2/wsserver.yaml >> ../logs/wsserver.log 2>&1 &