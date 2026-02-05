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
```

## config file
- bin/run-docker-enterprise.sh

## Run
```  
# run dependency
docker-compose -f ./docker-compose-env.yaml up -d

# run docker-compose
docker-compose -f ./docker-compose-enterprise.yaml up -d
```
