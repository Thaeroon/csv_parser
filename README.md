# csv_parser

## dependances

### ubuntu 21.10
pip install boto3
pip install psycopg
apt install postgresql

create the database and user 'csv_parser'

create a 'config.ini' file in the root folder looking like that:
[SQL]
host = localhost
dbname = csv_parser
user = csv_parser
password = 

apply 'database_schema.sql' script
