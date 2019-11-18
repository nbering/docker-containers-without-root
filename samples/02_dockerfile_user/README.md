# Sample: Dockerfile User

In this sample, we set the user to "nobody", which is a user pre-configured in
the "busybox" base image.

```sh
docker-compose build dockerfile_user

docker-compose run --rm dockerfile_user
```

Sample output:
```
2019/11/17 23:55:51 &{65534 65534 nobody nobody /home}
```
