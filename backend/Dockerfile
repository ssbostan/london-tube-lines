FROM python:alpine

LABEL maintainer="Saeid Bostandoust <ssbostan@yahoo.com>"

EXPOSE 8080

WORKDIR /opt/app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT ["gunicorn", "-c", "gunicorn.conf.py"]

CMD ["--workers", "2"]
