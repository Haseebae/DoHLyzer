FROM python:3.5.2-slim
RUN apt-get update && apt-get install -y tcpdump
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install libpcap
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "meter/dohlyzer.py"]
