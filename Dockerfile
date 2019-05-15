FROM python:3.5
USER root

COPY app_folder/contentful/ /app/
WORKDIR /app/
RUN pip3 install -r requirements.txt
EXPOSE 3000
ENTRYPOINT ["python3"]
CMD ["app.py"]
