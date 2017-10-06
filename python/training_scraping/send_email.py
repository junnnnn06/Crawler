import smtplib
from email.mine.text import MINEText
from email.header import Header

msg = MINEText('メール本文')
msg['Subject'] = Header('メールの件名','utf-8')
msg['From'] = 'adachi@mail.com'
mag['To'] = 'toyou@mail.com'

with smtplib.SMTP('localhost') as smtp
    smtp.send_message(msg)
