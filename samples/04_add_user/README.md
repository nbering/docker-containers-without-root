# Sample: Add User

This sample Dockerfile creates a new user as one of the build steps, and then
switches to it as the default user for the app.

```dockerfile
RUN useradd --no-log-init -r myapp
```

From the [Dockerfile Best Practices Guid](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#user),
`--no-log-init` prevents useradd command from re-writing the lastlog and faillog
files, which caused some issues with the way Docker stores the image layers.

If it is critical to use the same UID/GID every time, it's best to assign them
explicitly, as they will otherwise take the next in line, and other layers could
cause your application user to lose permission to files in mounted volumes.

```sh
docker-compose build add_user

docker-compose run --rm add_user
```

Sample output:
```
uid=999(myapp) gid=999(myapp) groups=999(myapp)
```
