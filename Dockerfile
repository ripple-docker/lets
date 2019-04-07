FROM python:3.7-slim

WORKDIR /let.s
ADD . .

RUN apt-get update && apt-get install -y python-dev mysql-server default-libmysqlclient-dev gcc

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

RUN python3.7 setup.py build_ext --inplace
RUN cd pp/oppai-ng && ./build

# agree to license
RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed

EXPOSE 5002

# Overwrite config
ENV DB_HOST db
ENV DB_USERNAME root
ENV DB_PASSWORD changeme
ENV REDIS_HOST redis
ENV BANCHO_URL http://peppy:5001
ENV BANCHO_API_KEY changeme
ENV OSU_API_KEY changeme
ENV CHEESEGULL_API_URL http://cheesegull/api

CMD ["python3.7", "-u", "lets.py"]