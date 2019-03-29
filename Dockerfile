FROM python:3.7-slim

WORKDIR /let.s
ADD . .

RUN apt-get update && apt-get install -y python-dev mysql-server default-libmysqlclient-dev gcc

# Install any needed packages specified in requirements.txt
RUN pip3 install --trusted-host pypi.python.org -r requirements.txt

RUN python3.7 setup.py build_ext --inplace

RUN cd pp/oppai-ng && ./build

RUN mkdir ~/.config && touch ~/.config/ripple_license_agreed
# generate config
RUN python3.7 -u lets.py 

EXPOSE 5002

# Run app.py when the container launches
CMD ["python3.7", "-u", "lets.py"]
