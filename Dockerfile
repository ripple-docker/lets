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

# generate config
RUN python3.7 -u lets.py 
RUN chmod +x entrypoint.sh

EXPOSE 5002
ENV OSUKEY pleasechangeme
ENV MYSQL_ROOT_PASSWORD changeme

ENTRYPOINT [ "./entrypoint.sh" ]
CMD ["python3.7", "-u", "lets.py"]
