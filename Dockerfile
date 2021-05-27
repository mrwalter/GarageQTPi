# Python Base Image from https://hub.docker.com/r/arm32v7/python/
FROM arm32v7/python:3.8.1-buster

# set the working directory in the container
WORKDIR /code

# copy the dependencies file to the working directory
COPY requirements.txt .

# install dependencies
RUN pip install -r requirements.txt

# copy the content of the local src directory to the working directory
COPY . .

# prevent buffering
ENV PYTHONUNBUFFERED=1

# command to run on container start
ENTRYPOINT [ "python3", "main.py" ]
