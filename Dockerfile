FROM python:alpine3.8-alpine

# Define any variables we require
EXPOSE 5000
ENV PYTHONPATH=/app
ENV TZ=America/New_York

# Install whatever system packages we need
RUN apk update && \
    apk add curl iputils nano tzdata

# Set up the app in the proper location
RUN mkdir -p /app
COPY [ "get-requirements.py", "poetry.lock", "pyproject.toml", "run-app.sh", "/app/" ]
WORKDIR . /app

# Install the dependencies
RUN python3 -m pip install pip --upgrade && \
    pip3 install --no-cache-dir toml && \
    python3 ./get-requirements.py && \
    pip3 install --no-cache-dir -r requirements.txt && \
    rm ./requirements.txt && \
    chmod u+x ./run-app.sh

# Start the gunicorn service to run the app
ENTRYPOINT ["sh", "/run-app.sh" ]
