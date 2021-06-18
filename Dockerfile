FROM debian
RUN apt update ; apt install -y dh-python python-all python3-stdeb
WORKDIR /app
ENTRYPOINT python3 setup.py --command-packages=stdeb.command bdist_deb