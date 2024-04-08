FROM python:3.10-alpine3.19

# Declare the arguments for the docker image
ARG GIT_URL

# Copy the requirements so it can install them
ADD requirements.txt /tmp/requirements.txt

# Update pip before installing packages
RUN python -m pip install --upgrade pip

# Install required packages
RUN pip install -r /tmp/requirements.txt

# Update the package list
RUN apk update

# Copy the enviroment variables
COPY .env /tmp/.env
RUN source /tmp/.env

# Install git and clone the repo
RUN apk add git
RUN git clone $GIT_URL /project

# Use this dir for more commands
WORKDIR /project/app
# Expose the port that the Flask app will run on
EXPOSE 5000

# Set the command to run the Flask app
CMD /usr/local/bin/gunicorn -b 0.0.0.0:5000 application:app