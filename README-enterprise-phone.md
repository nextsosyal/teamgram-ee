# INSTALL Teamgram Server side

## Init
```
mkdir /opt/data
git clone https://teamgram.io/teamgram-server/teamgram2.git
cd /opt/data/teamgram2
cd src
mkdir github.com
mkdir github.com/teamgram
mkdir teamgram.io
cd /opt/data/teamgram2/src/github.com/teamgram
git clone https://github.com/teamgram/teamgram-server.git
cd /opt/data/teamgram2/src/teamgram.io
git clone https://repo.teamgram.io/teamgram-server/enterprise.git
git clone https://repo.teamgram.io/teamgram-server/teamcalls-server.git
cd teamcalls-server/third_party
git clone https://repo.teamgram.io/teamgram-server/mediasoup-go.git
cd mediasoup-go
git checkout 6fc9be5
cd ..
git clone https://repo.teamgram.io/teamgram-server/mediasoup.git
```

## config file
- etc/phone.yaml
```
WebrtcConnections:
  - Turn: true
    Stun: true
    Ip: "43.155.11.190" ### change to your server ip
    Ipv6: ""
    Port: 3478
    Username: "nebula.chat"
    Password: "12345678"
```

**Note** you need to change the `Ip` to your server's public IP address.

- bin/run-docker-phone.sh
```
echo "run turnserver ..."
turnserver -v -r 192.168.10.150:3478 -a -o -c ../etc2/turnserver.conf --log-file ../logs/turnserver.log
```

**Note** you need to change the `-r` option to your server's public IP address.

## Run
```  
# run dependency
docker-compose -f ./docker-compose-env.yaml up -d

# run docker-compose
docker-compose -f ./docker-compose-enterprise-phone.yaml up -d
```

## sfu

```
TransportListenIp: 0.0.0.0

SFUConf:
  #WorkerBin: "/opt/data/teamgram/bin/worker/mediasoup-worker"
  #WorkerBin: "/Users/wubenqi/go/src/teamgram.io/teamcalls-server/third_party/mediasoup/worker/out/Debug/mediasoup-worker"
  WorkerBin: "/opt/data/teamgram/src/teamgram.io/teamcalls-server/third_party/mediasoup/worker/out/Release/mediasoup-worker"
  NumWorkers: 1
  WebRtcTransportListenIps:
    - Ip: 0.0.0.0
      AnnouncedIp: 192.168.10.106 # Internet or Public IP
  PlainTransportListenIp:
    Ip: 0.0.0.0
    AnnouncedIp: 192.168.10.106 # Internet or Public IP
  WebRtcMinPort: 55000
  WebRtcMaxPort: 55600
```

**Note:** need to manually modify the `AnnouncedIp` and restart all services


