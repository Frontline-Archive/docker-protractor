# docker-protractor
Docker image setup with protractor pre-installed. This image has chrome and firefox.

# Requisites
* link the host to test
* -v attach /dev/shm to have shared memory for chrome ( optional this is for perfomance )
* -v attach the project location

# Running the image
```
docker run -it --name protractor-runner \
    --link observation-public:observation-public \
    -v /dev/shm:/dev/shm \
    -v $(pwd):/protractor/project \
    sinet/protractor
```
