FROM python:3.6.7-alpine
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN apk update && \
    apk add --virtual build-deps gcc python-dev musl-dev && \
    apk add postgresql-dev
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD ./ /code/
CMD ["python", "manage.py", "runserver", "0.0.0.0:8001"]