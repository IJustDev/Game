FROM nickblah/lua:5.1-luarocks

WORKDIR /opt/game

COPY . .

RUN apt update && apt install -y build-essential && luarocks install luasocket

EXPOSE 25566/udp

ENTRYPOINT ["lua", "server.lua"]

