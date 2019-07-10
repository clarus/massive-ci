# Massive CI
> Make sure no one kills my or my friends' projects

A collection of Dockerfiles, each one testing a different project. All the Dockerfiles should be able to build.

To build all the images:
```
sudo ./run.sh
```

To build all the images without the Docker cache:
```
sudo ./run.sh --no-cache
```

To test one image:
```
sudo docker build folder_name/
```
