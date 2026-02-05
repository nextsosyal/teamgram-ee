#!/usr/bin/env bash
SERVICE=$1

if [ -z "$SERVICE" ]; then
    echo "Kullanim: ./build-enterprise-phone.sh <servis_adi>"
    echo "Ornek: ./build-enterprise-phone.sh idgen"
    exit 1
fi

TEAMGRAMIO="/opt/data/teamgram/src/teamgram.io"

if [ "$SERVICE" = "sfu" ] || [ "$SERVICE" = "phone" ] || [ "$SERVICE" = "bff" ] || [ "$SERVICE" = "biz" ]; then
    cd ${TEAMGRAMIO}/teamcalls-server
    make $SERVICE
else
    cd ${TEAMGRAMIO}/enterprise
    make $SERVICE
fi
