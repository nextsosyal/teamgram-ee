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
