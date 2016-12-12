# Start with a base Python 2.7.8 image
FROM python:2.7.8

MAINTAINER Arturo Ochoa <arturo.era@gmail.com>

# Add the external tasks directory into /tasks
ADD tasks /tasks

# Install the required dependencies via pip
RUN pip install -r /tasks/requirements.txt

# Expose the required Locust ports
EXPOSE 5557 5558 8089

# Set script to be executable
RUN chmod 755 /tasks/run.sh

# Start Locust using LOCUS_OPTS environment variable
ENTRYPOINT ["/tasks/run.sh"]
