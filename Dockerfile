FROM python:3.11

RUN mkdir /app

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1 
ENV PYTHONUNBUFFERED 1

COPY requirements.txt /app

RUN python -m venv venv

RUN . venv/bin/activate

RUN pip install -r requirements.txt

COPY . .

RUN python manage.py migrate

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
