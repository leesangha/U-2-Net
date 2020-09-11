FROM //


WORKDIR /app

COPY requirements.txt /app

RUN pip3 install --upgrade pip setuptools
RUN pip3 install -r requirements.txt

COPY . /app

CMD python3 app.py