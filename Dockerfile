# inherit prebuilt image
FROM python:3.9-slim-buster

# env setup
RUN mkdir /Fizilion && chmod 777 /Fizilion
ENV PATH="/Fizilion/bin:$PATH"
WORKDIR /Fizilion
RUN pip3 install megatools

# clone repo
RUN git clone https://github.com/DunggVN/ProjectFizilion -b DunggVN /Fizilion

# Copies session and config(if it exists)
COPY ./sample_config.env ./userbot.session* ./config.env* /Fizilion/

# install required pypi modules
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

# Finalization
CMD ["python3","-m","userbot"]
