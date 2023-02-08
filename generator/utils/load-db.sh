cd /root/tpcds-kit/tools
mkdir /root/tpcds-kit/tmp
for i in `ls *.dat`; do
  table=${i/.dat/}
  echo "Loading $table..."
  sed 's/|$//' $i > /root/tpcds-kit/tmp/$i
  psql "$DBCRED" -q -c "TRUNCATE $table"
  psql "$DBCRED" -c "\\copy $table FROM '/root/tpcds-kit/tmp/$i' CSV DELIMITER '|'"
done
rm -rf /root/tpcds-kit/tmp