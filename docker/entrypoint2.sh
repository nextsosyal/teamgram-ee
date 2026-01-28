#!/bin/bash
# if [ ! -n "$TEAMGRAM_HOST" ]; then
#   echo ">>> Plase set environment variable TEAMGRAM_HOST to your own server IP. <<<"
#   exit 1
# fi

export TEAMGRAM_HOST=${TEAMGRAM_HOST:-"0.0.0.0"}
export ETCD_URL=${ETCD_URL:-"etcd:2379"}
export REDIS_HOST=${REDIS_HOST:-"redis:6379"}
export KAFKA_HOST=${KAFKA_HOST:-"kafka:9092"}
export MYSQL_URI=${MYSQL_URI:-"teamgram:teamgram@tcp(mysql:3306)/teamgram?charset=utf8mb4"}
export MINIO_URI=${MINIO_URI:-"minio:9000"}
export MINIO_KEY=${MINIO_KEY:-"minio"}
export MINIO_SECRET=${MINIO_SECRET:-"miniostorage"}
export MINIO_SSL=${MINIO_SSL:-"false"}
#export MTZ=${MTZ:-"Asia%2FTehran"}

export CODE_NAME=${CODE_NAME:-"none"}

# Notification environment variables
export NOTIFICATION_BASE_URL=${NOTIFICATION_BASE_URL:-""}
export NOTIFICATION_KEY=${NOTIFICATION_KEY:-""}
export NOTIFICATION_SECRET=${NOTIFICATION_SECRET:-""}

# Push Notification (Hermes) environment variables
export PUSH_ENABLED=${PUSH_ENABLED:-"true"}

# Bypass Code environment variables
export BYPASS_CODE=${BYPASS_CODE:-""}

# create configs from config templates.
createConfigs() {
  CONFIG_TARGET_DIR=/opt/data/teamgram/etc2
  CONFIG_TEMPLATES_DIR=/opt/data/teamgram/etc
  for file in `ls $CONFIG_TEMPLATES_DIR`; do
    cat $CONFIG_TEMPLATES_DIR/$file \
      | sed 's#ListenOn: 127.0.0.1#ListenOn: '"$TEAMGRAM_HOST"'#g' \
      | sed "s#127.0.0.1:2379#$ETCD_URL#g" \
      | sed "s#127.0.0.1:6379#$REDIS_HOST#g" \
      | sed "s#localhost:6379#$REDIS_HOST#g" \
      | sed "s#root:@tcp(127.0.0.1:3306)/teamgram?charset=utf8mb4#$MYSQL_URI#g" \
      | sed 's#AccessKeyID: minio#AccessKeyID: '"$MINIO_KEY"'#g' \
      | sed 's#SecretAccessKey: miniostorage#SecretAccessKey: '"$MINIO_SECRET"'#g' \
      | sed 's#UseSSL: false#UseSSL: '"$MINIO_SSL"'#g' \
      | sed "s#localhost:9000#$MINIO_URI#g" \
      | sed "s#127.0.0.1:9092#$KAFKA_HOST#g" \
      | sed 's#\${CODE_NAME}#'"$CODE_NAME"'#g' \
      | sed 's#\${NOTIFICATION_BASE_URL}#'"$NOTIFICATION_BASE_URL"'#g' \
      | sed 's#\${NOTIFICATION_KEY}#'"$NOTIFICATION_KEY"'#g' \
      | sed 's#\${NOTIFICATION_SECRET}#'"$NOTIFICATION_SECRET"'#g' \
      | sed 's#\${PUSH_ENABLED:[^}]*}#'"$PUSH_ENABLED"'#g' \
      | sed 's#\${BYPASS_CODE}#'"$BYPASS_CODE"'#g' \
      | cat > $CONFIG_TARGET_DIR/$file
  done
}

createConfigs

#cd /opt/data/teamgram/bin
#./runall2.sh
#
#tail -f /dev/null
