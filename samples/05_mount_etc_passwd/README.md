# Samples: Mount /etc/passwd

This is a novel solution to a problem I've faced from time-to-time...

How does one ensure that a user inside the container matches one that is outside
the container?

You might ask why that even matters. My simplest example would be one where you
have bind-mounted a directory owned by some unprivileged user, and are going
to modify files. If you run this as room, you risk creating files that the user
cannot later change or delete.

This sample users [docker-compose.yml](../../docker-compose.yml) to do most of
the work.

```yml
---
version: "3.7"
services:
  mount_etc_passwd:
    image: "debian:buster-slim"
    command: "id"
    user: "999:999"
    volumes:
      - "./samples/05_mount_etc_passwd/passwd:/etc/passwd:ro"
      - "./samples/05_mount_etc_passwd/group:/etc/group:ro"
```

Here, we set the user and group by uid and gid. Note that if the gid were not
set for this example, the user's gid would be `0`, giving it root privileges.

In this case I'm mounting a file from the repository, because I'm using Docker
for Mac, and mounting `/etc/passwd` in my development environment doesn't help
me anyway. But this can be useful on Linux server or workstation environments.

If you run the sample, you'll get:

```
uid=999(myapp) gid=999(myapp) groups=999(myapp)
```

Note that even though the uid `999` doesn't exist in the container's base image,
it has a proper name in the container.

To run:
```sh
docker-compose build mount_etc_passwd

docker-compose run --rm mount_etc_passwd
```
