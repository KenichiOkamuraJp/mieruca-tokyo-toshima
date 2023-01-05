FROM debian:buster

RUN DEBIAN_FRONTEND=noninteractive apt update && apt -y upgrade
RUN apt-get install -y python3 python3-pip python3-dev

# 環境設定
ENV PYTHONIOENCODING utf-8

# ライブラリ取り込み
COPY requirements.txt /
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r requirements.txt

RUN mkdir work
COPY gijiroku_streamlit.py /
COPY config.yaml /
COPY data /data
COPY static /static

ENTRYPOINT ["streamlit","run","gijiroku_streamlit.py", "--server.port=8501"]

EXPOSE 8501
