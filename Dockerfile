FROM ubuntu:18.04

RUN apt update && apt upgrade -y
RUN apt install fontconfig \
                libfontconfig \
                build-essential \
                chrpath \
                libssl-dev \
                libxft-dev \
                libfreetype6 \
                libfreetype6-dev \
                libfontconfig1 \
                libfontconfig1-dev \
                -y

RUN apt install python3-pip -y
RUN pip3 install --upgrade pip 
RUN pip3 install --upgrade psutil
RUN pip3 install numpy \
                selenium \
                faker \
                pyopenssl \
                requests \
                cffi

RUN pip3 list
# https://github.com/essandess/isp-data-pollution#headless
RUN apt install xvfb -y
RUN pip3 install pyvirtualdisplay

COPY build/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/share
ENV PHANTOM_JS="phantomjs-2.1.1-linux-x86_64"
RUN ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin
COPY isp_data_pollution.py isp_data_pollution.py

CMD ["python3", "isp_data_pollution.py"]
