# build, push
FROM nvcr.io/nvidia/pytorch:25.09-py3

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY script.py .

CMD ["python", "script.py"]
