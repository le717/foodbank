FROM python:alpine3.8

# Define any variables we require
EXPOSE 5000
ENV PYTHONPATH=/app
ENV TZ=America/New_York

# Install whatever system packages we need
RUN apk update && \
    apk add curl iputils nano tzdata

# Copy the app into the proper location
RUN mkdir -p /app
COPY . /app

# Install the dependencies
WORKDIR /app
RUN pip3 install --no-cache-dir --upgrade pip
RUN pip3 install --no-cache-dir -r ./requirements/base.txt -r ./requirements/prod.txt

# Start the gunicorn service to run the app
COPY run-app.sh /run-app.sh
RUN chmod u+x /run-app.sh
ENTRYPOINT ["sh", "/run-app.sh" ]
