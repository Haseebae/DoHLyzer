FROM ubuntu:22.04
RUN apt-get update && apt-get install -y \
    python3.5 \
    python3-pip \
    python3-dev \
    tcpdump 
RUN ln -s /usr/bin/python3.5 /usr/local/bin/python
RUN ln -s /usr/bin/pip3 /usr/local/bin/pip
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install libpcap
RUN pip install -r requirements.txt
COPY . .
CMD ["python3", "meter/dohlyzer.py"]

# FROM python:3.5.2-slim
# RUN apt-get update && apt-get install -y tcpdump
# COPY requirements.txt .
# RUN pip install --no-cache-dir --upgrade pip
# RUN pip install libpcap
# RUN pip install -r requirements.txt
# COPY . .
# CMD ["python", "meter/dohlyzer.py"]
