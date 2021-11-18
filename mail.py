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


def send_mail(addr_to='opr@rosenergo.com', subject=None, text=None, filepath=None):
    msg = MIMEMultipart()  # Создаем сообщение
    msg['From'] = addr_from  # Адресат
    msg['To'] = addr_to  # Получатель
    msg['Subject'] = subject
    body = text
    msg.attach(MIMEText(body, 'plain'))
    # TODO сделать функцию для прикрепления приложения к письму дублируется код. Сейчас сталкиваюсь с проблемой
    # TODO аутентификации
    if type(filepath) == list:# Добавляем в сообщение текст
        for file in filepath:
            filename = os.path.basename(file)
            ctype, encoding = mimetypes.guess_type(file)
            maintype, subtype = ctype.split('/', 1)
            with open(file, 'rb') as fp:
                file = MIMEBase(maintype, subtype)  # Используем общий MIME-тип
                file.set_payload(fp.read())  # Добавляем содержимое общего типа (полезную нагрузку)
                fp.close()
            encoders.encode_base64(file)
            file.add_header('Content-Disposition', 'attachment', filename=filename) # Добавляем заголовки
            msg.attach(file)
    if type(filepath) == str:
        with open(filepath, 'rb') as fp:
            file = MIMEBase(maintype, subtype)  # Используем общий MIME-тип
            file.set_payload(fp.read())  # Добавляем содержимое общего типа (полезную нагрузку)
            fp.close()
        encoders.encode_base64(file)
        file.add_header('Content-Disposition', 'attachment', filename=filename)  # Добавляем заголовки
        msg.attach(file)


    server = smtplib.SMTP_SSL('smtp.mail.ru', 465)
    server.login(addr_from, password)
    server.send_message(msg)
    server.quit()