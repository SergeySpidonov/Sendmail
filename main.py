import pandas as pd
from dotenv import dotenv_values
import sqlalchemy
import os
from mail import send_mail
import zipfile


_values = dotenv_values()
DB = _values.get("DB")


ADDR_TO = _values.get("addr_to")
ADDR_FROM = _values.get("addr_from")
WORKDIR = _values.get("FILEPATH")

DB_CONN = dotenv_values().get('DB_CONN')
conn = sqlalchemy.create_engine(DB_CONN)
csv_list = []
PATH = _values.get('FILEPATH')
zip_path = os.path.join(PATH, 'csv', 'postgres_revise.zip')
with zipfile.ZipFile(zip_path, 'w') as zip:
    for root, dirs, files in os.walk(os.path.join(PATH, 'KKD', DB)):
        for filename in files:
            sql = ''
            with open(os.path.join(PATH, 'KKD', DB, filename), 'r') as sql_file:
                for line in sql_file:
                    sql += line
                df = pd.read_sql(sql=sql, con=conn)
                csv_name = filename.replace('.sql', '.csv')
                csv_path = os.path.join(PATH, 'csv', csv_name)
                csv_list.append(csv_path)
                df.to_csv(csv_path, index=False, sep=';')
                zip.write(csv_path, arcname=csv_name)

send_mail(addr_to=ADDR_TO, subject='Postgres revise', text='test', filepath=zip_path,
          addr_from=ADDR_FROM)
