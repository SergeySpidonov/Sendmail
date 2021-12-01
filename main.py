import pandas as pd
from dotenv import dotenv_values
import sqlalchemy
import os
from mail import send_mail
import zipfile


_values = dotenv_values()
DB = _values.get("DB")


ADDR_TO = _values.get("addr_to")
FILEPATH = _values.get("FILEPATH")

DB_CONN = dotenv_values().get('DB_CONN')
conn = sqlalchemy.create_engine(DB_CONN)
csv_list = []
PATH = dotenv_values().get('FILEPATH')
with zipfile.ZipFile(os.path.join(PATH, 'csv', 'postgres_revise.zip'), 'w') as zip:
    for root, dirs, files in os.walk(os.path.join(PATH, 'KKD', DB)):
        for filename in files:
            sql = ''
            with open(os.path.join(PATH, 'KKD', DB, filename), 'r') as sql_file:
                for line in sql_file:
                    sql += line
                df = pd.read_sql(sql=sql, con=conn)
                csv_path = os.path.join(PATH, 'csv', filename.replace('.sql', '.csv'))
                csv_list.append(csv_path)
                df.to_csv(csv_path, index=False, sep=';')
                zip.write(csv_path)

send_mail(addr_to=ADDR_TO, subject='Postgres revise', text='test', filepath=csv_list,
          addr_from='vm-dras-publish-red@rosenergo.com')
