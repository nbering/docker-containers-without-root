# Docker Containers without Root
Playing with some different ways of running docker containers without using root continuously.

# Samples
## Control

Like any good scientific experiment, we need a Control case. In this case, it's
a simple(ish) multi-phase container build. First, we compile a tiny little Go-lang
app. It just outputs some raw info about the current user - inside the container - and exits.

Then, we create our actual Control image. It's a basic busybox image with our 
"app" copied from the go-lang build image.

To run the test case:

```sh
docker-compose build control

docker-compose run --rm control
```

Sample output:
```
2019/11/17 23:31:20 &{0 0 root root /root}
```

## TODO
### Dropping Permissions
- [ ] Dockerfile USER directive
- [ ] [gosu](https://github.com/tianon/gosu) in entry-point script

### Managing UID/GID
- [ ] Manipulating users and groups during container build
  - [`useradd`](https://manpages.debian.org/buster/passwd/useradd.8.en.html)
  - [`usermod`](https://manpages.debian.org/buster/passwd/usermod.8.en.html)
  - [`groupadd`](https://manpages.debian.org/buster/passwd/groupadd.8.en.html)
  - [`groupmod`](https://manpages.debian.org/buster/passwd/groupmod.8.en.html)
- [ ] Read-only mounts of `/etc/passwd`
- [ ] Using [nss_wrapper](https://cwrap.org/nss_wrapper.html) to fake local users and/or remote hosts
- [ ] Manipulating filesystem permissions on container start

## References
- [Dockerfile Best Practices](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
- [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
- [docker-compose File Reference](https://docs.docker.com/compose/compose-file/)
- [Official Library Image: Postgres](https://hub.docker.com/_/postgres)
  - handles privileges particularly well as official images go
