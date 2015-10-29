## Running Onedrive Ubuntu inside the docker container

## Build your docker images and run them

You can simply run the provided script and it will build and deploy the docker
images for you.

Deploying docker image.

```
make deploy
```

Accessing shell to the container

```
make shell

```

Setup Onedrive

```
make configure
```

Running the Onedrive daemon

```
make run_daemon

```
