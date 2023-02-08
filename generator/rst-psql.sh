docker compose down --volumes
docker run --rm -v $HOME:/app -w /app busybox rm -rf tpcds-vol/psql
mkdir -p $HOME/tpcds-vol/psql
