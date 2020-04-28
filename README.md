# Kali Linux Systemd Docker

## Install Image
```bash
docker pull fedeya/kali-systemd
```
## Run Container

### Use of the graphical interface for Burpsuite, etc.

**To use the graphical interface, use `xhost +` in a separate terminal and when done use `xhost -`**

```bash
docker run -d \
  --name kali \
  --cap-add SYS_ADMIN \
  --network host \
  --privileged \
  -e DISPLAY=$DISPLAY \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  fedeya/kali-systemd \
  systemd.unit=emergency.service
```


### Without using a graphical interface

```bash
docker run -d \
  --name kali \
  --network host \
  --privileged \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  fedeya/kali-systemd \
  systemd.unit=emergency.service 
```

## Start Container
```bash
docker start kali # or the name for you container 
```

## Enter to Container

```bash
docker exec -ti kali bash 
```

## Delete Container
```bash
docker rm kali # or the name for you container 
```

## Delete Image
```bash
docker rmi fedeya/kali-systemd
```

## Build Image

if you want to build your image by cloning this repository or the image not exist in docker hub use these commands

```bash
git clone git://github.com/Fedeya/kali-systemd
cd kali-systemd
docker build -t fedeya/kali-systemd # or the name for you wish .
```