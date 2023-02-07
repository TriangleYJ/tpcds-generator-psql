cd /root/tpcds-kit/tools
/root/tpcds-kit/tools/dsdgen -SCALE ${1:-1} -FORCE -VERBOSE
/root/tpcds-kit/tools/dsqgen -SCALE ${1:-1} -DIRECTORY /root/tpcds-kit/query_templates -INPUT /root/tpcds-kit/query_templates/templates.lst -VERBOSE Y -QUALIFY Y -DIALECT netezza

