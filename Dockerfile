FROM ubuntu:focal

RUN sed -i 's/htt[p|ps]:\/\/archive.ubuntu.com\/ubuntu\//mirror:\/\/mirrors.ubuntu.com\/mirrors.txt/g' /etc/apt/sources.list

RUN apt update -y

RUN apt install -y ca-certificates wget && wget -O "/usr/share/keyrings/xpra.asc" https://xpra.org/xpra.asc && apt update
RUN apt install xpra -y
RUN apt install x11-apps -y
RUN apt install xterm -y
RUN apt install dbus-x11 -y
RUN mkdir /usr/share/xpra/www
COPY ./www /usr/share/xpra/www
# RUN apt install xvfb -y

# non-root user
RUN adduser --disabled-password --gecos "VICE_User" --uid 1000 user
RUN mkdir -p /run/user/1000/xpra
RUN mkdir -p /run/xpra
RUN chown user:user /run/user/1000/xpra
RUN chown user:user /run/xpra

USER user

WORKDIR /home/user

EXPOSE 9876
CMD xpra start --bind-tcp=0.0.0.0:9876 --html=on --start-child=xterm --exit-with-children=no --daemon=no 