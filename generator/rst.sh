docker compose down --volumes
docker run --rm -v $HOME:/app -w /app busybox rm -rf tpcds-vol
mkdir -p $HOME/tpcds-vol/tpcds
mkdir -p $HOME/tpcds-vol/psql
