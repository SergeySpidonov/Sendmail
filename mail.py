from email.mime.text import MIMEText
from email.mime.application import MIMEApplication
import smtplib                                      # Импортируем библиотеку по работе с SMTP
from email.mime.multipart import MIMEMultipart      # Многокомпонентный объект
from dotenv import dotenv_values

_values = dotenv_values()

addr_from = _values.get("addr_from")                # Адресат
addr_to   = _values.get("addr_to")                   # Получатель
password  = _values.get("password")                             # Пароль
FILEPATH = _values.get("FILEPATH")
proxy_host = _values.get("PROXY_HOST")


def send_mail(addr_to=None, subject=None, text=None, filepath=None, addr_from=None):
    msg = MIMEMultipart()  # Создаем сообщение
    msg['From'] = addr_from  # Адресат
    msg['To'] = addr_to  # Получатель
    msg['Subject'] = subject
    body = text
    msg.attach(MIMEText(body, 'plain'))
    if filepath:
        if isinstance(filepath, str):
            filepath = [filepath, ]
        for file in filepath:
            with open(file, 'rb') as f:
                # Attach the file with filename to the email
                filename = file.split('/')[-1]
                msg.attach(MIMEApplication(f.read(), Name=filename))

    if isinstance(addr_to, str):
        addr_to = [addr_to, ]

    s = smtplib.SMTP('smtp.rosenergo.com')
    for addr in addr_to:
        msg['To'] = addr
        try:
            s.send_message(msg)
        except smtplib.SMTPRecipientsRefused:
            # игнорируем, если почта косячная
            pass
        # библиотека накапливает адресатов внутри, надо очищать
        del msg['To']
        del msg['Cc']
    s.quit()

