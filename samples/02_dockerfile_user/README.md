# Sample: Dockerfile User

In this sample, use the Dockerfile to change the user to "nobody". This user is
pre-configured in the "debian:buster-slim" base image.

```sh
docker-compose build dockerfile_user

docker-compose run --rm dockerfile_user
```

Sample output:
```
uid=65534(nobody) gid=65534(nogroup) groups=65534(nogroup)
```
