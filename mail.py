from email.mime.text import MIMEText
from email import encoders
import mimetypes
import smtplib                                      # Импортируем библиотеку по работе с SMTP
from email.mime.multipart import MIMEMultipart      # Многокомпонентный объект
from email.mime.base import MIMEBase                # Текст/HTML
import os
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
    if type(filepath) == list:# Добавляем в сообщение текст
        for file in filepath:
            filename = os.path.basename(file)
            ctype, encoding = mimetypes.guess_type(file)
            maintype, subtype = ctype.split('/', 1)
            with open(file, 'rb') as fp:
                file = MIMEBase(maintype, subtype)  # Используем общий MIME-тип
                file.set_payload(fp.read())  # Добавляем содержимое общего типа (полезную нагрузку)
            encoders.encode_base64(file)
            file.add_header('Content-Disposition', 'attachment', filename=filename) # Добавляем заголовки
            msg.attach(file)
    if type(filepath) == str:
        with open(filepath, 'rb') as fp:
            file = MIMEBase(maintype, subtype)  # Используем общий MIME-тип
            file.set_payload(fp.read())  # Добавляем содержимое общего типа (полезную нагрузку)
        encoders.encode_base64(file)
        file.add_header('Content-Disposition', 'attachment', filename=filename)  # Добавляем заголовки
        msg.attach(file)

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

