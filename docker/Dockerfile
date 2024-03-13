FROM python:3.11.8-bookworm

#COPY ./app ./app

WORKDIR /app

RUN pip install -r requirements.txt

EXPOSE 8000

CMD uvicorn main:app --reload