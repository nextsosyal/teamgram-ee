# INSTALL

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
git clone https://repo.teamgram.io/teamgram-server/teamcalls-server.git
git checkout teamgram-server
cd teamcalls-server/third_party
git clone https://repo.teamgram.io/teamgram-server/mediasoup-go.git
cd mediasoup-go
git checkout 6fc9be5
cd ..
git clone https://repo.teamgram.io/teamgram-server/mediasoup.git
```

## Run
```  
# run dependency
docker-compose -f ./docker-compose-env.yaml up -d

# run docker-compose
docker-compose -f ./docker-compose-phone.yaml up -d
```

## sfu

```
TransportListenIp: 127.0.0.1 #192.168.10.105

SFUConf:
  #WorkerBin: "/opt/data/teamgram/bin/worker/mediasoup-worker"
  #WorkerBin: "/Users/wubenqi/go/src/teamgram.io/teamcalls-server/third_party/mediasoup/worker/out/Debug/mediasoup-worker"
  WorkerBin: "/opt/data/teamgram/src/teamgram.io/teamcalls-server/third_party/mediasoup/worker/out/Release/mediasoup-worker"
  NumWorkers: 1
  WebRtcTransportListenIps:
    - Ip: 172.20.0.2 # Internal IP for Docker
      AnnouncedIp: 192.168.10.106 # Public IP
  PlainTransportListenIp:
    Ip: 172.20.0.2 # Internal IP for Docker
    AnnouncedIp: 192.168.10.106 # Public IP
  WebRtcMinPort: 55000
  WebRtcMaxPort: 55600
```

**Note:** need to manually modify the `IP` and `AnnouncedIp` and restart all services


