docker build -t blog .
docker run -ti --rm -p 4000:4000 --name blog blog
PAUSE