cd /root/tpcds-kit/tools
for i in `ls *.dat`; do
  table=${i/.dat/}
  echo "Loading $table..."
  sed 's/|$//' $i > /tmp/$i
  psql "$DBCRED" -q -c "TRUNCATE $table"
  psql "$DBCRED" -c "\\copy $table FROM '/tmp/$i' CSV DELIMITER '|'"
done
