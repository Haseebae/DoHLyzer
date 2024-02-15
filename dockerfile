FROM ubuntu:22.04

RUN apt-get update && apt-get install -y build-essential tcpdump wget 

RUN mkdir -p /opt/conda 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /opt/conda/miniconda.sh && \
    bash /opt/conda/miniconda.sh -b -p /opt/miniconda

COPY environment.yaml /tmp 
RUN /opt/miniconda/bin/conda env update --name base --file /tmp/environment.yaml 

RUN mkdir /app 
WORKDIR /app
COPY . /app

# Run the software in conda base environment 
CMD ["/opt/miniconda/bin/conda", "run", "--no-capture-output", "-n", "base", "python3", "meter/dohlyzer.py", "-f", "sample2.pcap", "-c", "testing_doc.csv"]
