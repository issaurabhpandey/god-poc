FROM python:alpine3.17@sha256:ab54613ad5bc67ae68a123837c7a4ac720ecd6ae81e002c796182074cda2f529

RUN apk add --no-cache python3-dev \
    && pip3 install --upgrade pip

WORKDIR /app
COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt

EXPOSE 5000

ENTRYPOINT ["python3"]
CMD ["app.py"]