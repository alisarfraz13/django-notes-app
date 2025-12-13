FROM python:3.9
WORKDIR /app/backend
COPY requirements.txt /app/backend
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*
# Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt
COPY . /app/backend
EXPOSE 8000
#RUN python manage.py migrate
#RUN python manage.py makemigrations
# Entrypoint: yeh default command ka wrapper hai, jo hamesha python manage.py ke saath chalata hai
ENTRYPOINT ["python3", "manage.py"]
# CMD: yeh ENTRYPOINT ko arguments deta hai, default server start command
CMD ["runserver", "0.0.0.0:8000"]
