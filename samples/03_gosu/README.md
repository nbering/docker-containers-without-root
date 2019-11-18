# Sample: gosu

[gosu](https://github.com/tianon/gosu) is a tool purpose-build for privilege
de-escalation in Docker containers. It provides a simple interface for changing
the user, and then running the new commands with `exec`, so that PID 1 in the
container is your application.

```sh
docker-compose build dockerfile_user

docker-compose run --rm dockerfile_user
```

Sample output:
```
-- Still have root here, could be used for setup --
2019/11/18 02:41:42 &{0 0 root root /root}
--- Giving up root... ---
2019/11/18 02:41:42 &{65534 65534 nobody nobody /home}
```
