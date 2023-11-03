# TODO

# Setup
Install Docker and related dependencies. [link](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Install libpq-dev for local rails apps using pg gem
```
sudo apt install libpq-dev
```

# Create/Start containers

start postgres-shared container
```
docker compose up postgres-shared --detach
```
