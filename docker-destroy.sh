docker rm $(docker ps -aq) -f
docker images -aq | xargs docker rmi