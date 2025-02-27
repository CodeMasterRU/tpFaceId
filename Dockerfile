FROM python:3.9-slim
ENV APP_HOME /app
WORKDIR $APP_HOME

# Install production dependencies.
RUN apt-get clean && apt-get -y update && apt-get install -y build-essential libopenblas-dev liblapack-dev libopenblas-dev liblapack-dev
RUN pip install cmake==3.25.2
RUN pip install dlib==19.9
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]