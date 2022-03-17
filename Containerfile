FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN delivery2 create-db
RUN delivery2 populate-db
RUN delivery2 add-user -u admin -p admin
EXPOSE 5000
CMD ["delivery2", "run"]
