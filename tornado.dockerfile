FROM python:3.6

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN cd /usr/src/app

# expose port
EXPOSE 8888 22

CMD [ "python", "./server.py" ]
