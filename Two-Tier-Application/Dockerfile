FROM python:3.9-slim

WORKDIR /app

COPY requirements.txt .

RUN apt-get update \
&& apt-get upgrade -y \
&& apt-get install -y gcc default-libmysqlclient-dev \ 
&& rm -rf /var/lib/apt/lists/* 

RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install python

COPY ..

CMD ["python", "app.py"]
