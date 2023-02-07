# tpcds-psql

It loads tpc-ds datasets into postgreSQL using user-defined scale.
It consists of two directory: generator and measure

## generator
- `SCALE`: SCALE factor 1 dataset is included in image, but you should manually run generator script for more bigger dataset.

### How to load TPC-DS set into my DB?
1. set `.env` (refer `.env.example`)
2. run `./r`
3. (Optional) run `./gen.sh <scale>` in container bash
4. run `./dbgen-schm.sh` in container bash
5. run `./load-db.sh` in container bash
6. (Optional) run `./run-query.sh` in container bash for performance test (you may need to modify query_0.sql)

## measure
