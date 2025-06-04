#!/usr/bin/env bash

echo "run idgen ..."
nohup ./idgen -f=../etc/idgen.yaml >> ../logs/idgen.log 2>&1 &
sleep 1

echo "run status ..."
nohup ./status -f=../etc/status.yaml >> ../logs/status.log 2>&1 &
sleep 1

echo "run authsession ..."
nohup ./authsession -f=../etc/authsession.yaml >> ../logs/authsession.log 2>&1 &
sleep 1

echo "run dfs ..."
nohup ./dfs -f=../etc/dfs.yaml >> ../logs/dfs.log 2>&1 &
sleep 1

echo "run media ..."
nohup ./media -f=../etc/media.yaml >> ../logs/media.log 2>&1 &
sleep 1

echo "run poll ..."
nohup ./poll -f=../etc/poll.yaml >> ../logs/poll.log 2>&1 &
sleep 1

echo "run twofa ..."
nohup ./twofa -f=../etc/twofa.yaml >> ../logs/twofa.log 2>&1 &
sleep 1

echo "run biz ..."
nohup ./biz -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc/biz.yaml >> ../logs/biz.log 2>&1 &
sleep 1

echo "run notify ..."
nohup ./notify -f=../etc/notify.yaml >> ../logs/notify.log 2>&1 &
sleep 1

echo "run webpage ..."
nohup ./webpage -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc/webpage.yaml >> ../logs/webpage.log 2>&1 &
sleep 1

echo "run adminlog ..."
nohup ./adminlog -f=../etc/adminlog.yaml >> ../logs/adminlog.log 2>&1 &
sleep 1

echo "run inbox ..."
nohup ./inbox -f=../etc/inbox.yaml >> ../logs/inbox.log 2>&1 &
sleep 1

echo "run msg ..."
nohup ./msg -f=../etc/msg.yaml >> ../logs/msg.log 2>&1 &
#nohup ./msg -usev3=true -f=../etc/msg.yaml >> ../logs/msg.log 2>&1 &
sleep 1

echo "run channelinbox ..."
nohup ./channelinbox -f=../etc/channelinbox.yaml >> ../logs/channelinbox.log 2>&1 &
sleep 1

echo "run channelmsg ..."
nohup ./channelmsg -f=../etc/channelmsg.yaml >> ../logs/channelmsg.log 2>&1 &
sleep 1

echo "run scheduledmessage ..."
nohup ./scheduledmessage -f=../etc/scheduledmessage.yaml >> ../logs/scheduledmessage.log 2>&1 &
sleep 1

echo "run sync ..."
nohup ./sync -f=../etc/sync.yaml >> ../logs/sync.log 2>&1 &
sleep 1

echo "run channelsync ..."
nohup ./channelsync -f=../etc/channelsync.yaml >> ../logs/channelsync.log 2>&1 &
sleep 1

echo "run botsync ..."
nohup ./botsync -f=../etc/botsync.yaml >> ../logs/botsync.log 2>&1 &
sleep 1

echo "run scheduled ..."
nohup ./scheduled -f=../etc/scheduled.yaml >> ../logs/scheduled.log 2>&1 &
sleep 1

echo "run push ..."
nohup ./push -f=../etc/push.yaml >> ../logs/push.log 2>&1 &
sleep 1

echo "run sfu ..."
nohup ./sfu -f=../etc/sfu.yaml >> ../logs/sfu.log 2>&1 &
sleep 1

echo "run botfather ..."
nohup ./botfather -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc/botfather.yaml >> ../logs/botfather.log 2>&1 &
sleep 1

echo "run gif ..."
nohup ./gif -f=../etc/gif.yaml >> ../logs/gif.log 2>&1 &
sleep 1

echo "run historyttl ..."
nohup ./historyttl -f=../etc/historyttl.yaml >> ../logs/historyttl.log 2>&1 &
sleep 1

echo "run bots ..."
nohup ./bots -f=../etc/bots.yaml >> ../logs/bots.log 2>&1 &
sleep 1

echo "run phone ..."
nohup ./phone -f=../etc/phone.yaml >> ../logs/phone.log 2>&1 &
sleep 1

echo "run storyq ..."
nohup ./storyq -f=../etc/storyq.yaml >> ../logs/storyq.log 2>&1 &
sleep 1

echo "run storygc ..."
nohup ./storygc -f=../etc/storygc.yaml >> ../logs/storygc.log 2>&1 &
sleep 1

echo "run business ..."
nohup ./business -f=../etc/business.yaml >> ../logs/business.log 2>&1 &
sleep 1

echo "run premium ..."
nohup ./premium -f=../etc/premium.yaml >> ../logs/premium.log 2>&1 &
sleep 1

echo "run miniapp ..."
nohup ./miniapp -f=../etc/miniapp.yaml >> ../logs/miniapp.log 2>&1 &
sleep 1

echo "run translation ..."
nohup ./translation -f=../etc/translation.yaml >> ../logs/translation.log 2>&1 &
sleep 1

echo "run bff ..."
#nohup ./bff -predefined=false -predefined2=false -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -store_product_annual="com.sends.telegramPremium.annual" -store_product_monthly="com.sends.telegramPremium.monthly" -f=../etc/bff.yaml >> ../logs/bff.log 2>&1 &
#nohup ./bff -predefined=false -predefined2=false -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -store_product_annual="com.sends.annual" -store_product_monthly="com.sends.monthly" -f=../etc/bff.yaml >> ../logs/bff.log 2>&1 &
nohup ./bff -predefined=false -predefined2=false -app_name="Teamgram" -t.me="teamgram.me" -site_name="teamgram.net" -f=../etc/bff.yaml >> ../logs/bff.log 2>&1 &
sleep 5

echo "run session ..."
nohup ./session -f=../etc/session.yaml >> ../logs/session.log 2>&1 &
sleep 1

echo "run gateway ..."
#nohup ./gateway -f=../etc/gateway.yaml >> ../logs/gateway.log 2>&1 &
GNET_LOGGING_LEVEL=-1 nohup ./gnetway -f=../etc/gnetway.yaml >> ../logs/gnetway.log 2>&1 &
sleep 1

echo "run tgadmin ..."
nohup ./tgadmin -f=../etc/tgadmin.yaml >> ../logs/tgadmin.log 2>&1 &
sleep 1

#echo "run cbmsg ..."
#nohup ./cbmsg -f=../etc/cbmsg.yaml >> ../logs/cbmsg.log 2>&1 &
#sleep 1

echo "run tgme ..."
nohup ./tgme -app_name="Teamgram" -t.me="teamgram.me" -tg=tg2 -cdn="/x" -site_name="teamgram.net" -f=../etc/tgme.yaml >> ../logs/tgme.log 2>&1 &
sleep 1

echo "run botway ..."
nohup ./botway -f=../etc/botway.yaml >> ../logs/botway.log 2>&1 &
sleep 1

echo "run wsserver ..."
nohup ./wsserver -f=../etc/wsserver.yaml >> ../logs/wsserver.log 2>&1 &
sleep 1

echo "run httpserver ..."
nohup ./httpserver -f=../etc/httpserver.yaml >> ../logs/httpserver.log 2>&1 &
