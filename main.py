import pandas as pd
from dotenv import dotenv_values
import sqlalchemy
import os
from mail import send_mail

_values = dotenv_values()

ADDR_FROM = _values.get("addr_from")
ADDR_TO = _values.get("addr_to")
PASSWORD = _values.get("password")
FILEPATH = _values.get("FILEPATH")

DB_CONN = dotenv_values().get('DB_CONN')
conn = sqlalchemy.create_engine(DB_CONN)
csv_list = []
PATH = dotenv_values().get('FILEPATH')

for root, dirs, files in os.walk(os.path.join(PATH, 'KKD')):
    for filename in files:
        df = pd.read_sql(sql=filename, con=conn)
        csv_path = os.path.join(PATH, 'csv', filename.replace('.sql', '.csv'))
        csv_list.append(csv_path)
        df.to_csv(path=os.path)

send_mail(addr_to='s.spiridonov@rosenergo.com', subject='тест', text='test', filepath=csv_list)
