FROM python:alpine3.17@sha256:ab54613ad5bc67ae68a123837c7a4ac720ecd6ae81e002c796182074cda2f529

RUN apk add --no-cache python3-dev \
    && pip3 install --upgrade pip \
    && apk add curl

WORKDIR /app
COPY . /app

RUN pip3 --no-cache-dir install -r requirements.txt
RUN chmod +x ./db-script.sh
RUN ./db-script.sh

EXPOSE 5001

ENTRYPOINT ["python3"]
CMD ["app.py"]