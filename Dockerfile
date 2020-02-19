# 1. Build process for node-based tooling
FROM node:alpine AS node-build

# Copy the required build files and CSS files
RUN mkdir -p /app
COPY . /app
WORKDIR /app

# Install everything and build the CSS
RUN npm install --quiet --production && npm run build


# 2. Build process for Python app
FROM python:3.8-alpine AS py-build

# Define any variables we require
EXPOSE 5000
ENV PYTHONPATH=/app
ENV TZ=America/New_York

# Install whatever system packages we need
# skipcq: DOK-DL3018
# RUN apk add --no-cache curl iputils nano tzdata

# Set up the app in the proper location
RUN mkdir -p /app
COPY [ "get-requirements.py", "poetry.lock", "pyproject.toml", "run-app.sh", "/app/" ]
COPY ./app/contrib /app/contrib/
WORKDIR /app

# Copy over the built CSS from the prior build step
COPY --from=node-build /app/app/static/build/style.min.css ./app/static/build/style.min.css

# Install the dependencies
# skipcq: DOK-DL3018
RUN python3 -m pip install --quiet pip --upgrade && \
  pip3 install --quiet --no-cache-dir toml && \
  python3 ./get-requirements.py && \
  pip3 install --quiet --no-cache-dir -r ./requirements.txt && \
  rm ./requirements.txt && \
  chmod u+x ./run-app.sh

# Start the gunicorn service to run the app
ENTRYPOINT [ "sh", "./run-app.sh" ]
