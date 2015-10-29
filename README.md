## Running Onedrive Ubuntu inside the docker container

## Build your docker images and run them

You can simply run the provided script and it will build and deploy the docker
images for you.

Before start to run this docker you have to:

Create onedrive account, then make new application. After that you will get application client ID 
and app client secret. Change the value of APP_CLIENT_ID and APP_CLIENT_SECRET in `docker-compose.yml` with yours.


```
- APP_CLIENT_ID=0000000040172910
- APP_CLIENT_SECRET=WAltBcwM9B3nlGDmplOUGfPLqsw5bHDA

```

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
