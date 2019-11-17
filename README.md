# Docker Containers without Root
Playing with some different ways of running docker containers without using root continuously.

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
