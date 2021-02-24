from python:3.7-slim

ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV TZ America/Bahia
ENV HOME=/home/app
ENV APP_HOME=/home/app/

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apt-get update && apt-get -y install postgresql-client libc-dev 
COPY requirements.txt .
RUN /usr/local/bin/python3 -m pip install -r requirements.txt
ADD . $APP_HOME


#- POSTGRES_USER=${POSTGRES_USER}
#RUN groupadd -r app && \
#    useradd -r -g app -d /home/app -s /sbin/nologin -c "Docker image user" app
#RUN chown -R app:app /home/app/
#USER app