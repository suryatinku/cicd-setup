FROM python:3.8-alpine
COPY . /app
WORKDIR /app
RUN mkdir populations
RUN rm -rf tests
RUN /usr/local/bin/python -m pip install --upgrade pip
RUN pip install -r requirements.txt
EXPOSE 5000
CMD ["python3","app.py"]
