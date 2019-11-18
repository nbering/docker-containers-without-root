# Sample: gosu

[gosu](https://github.com/tianon/gosu) is a tool purpose-build for privilege
de-escalation in Docker containers. It provides a simple interface for changing
the user, and then running the new commands with `exec`, so that PID 1 in the
container is your application.

In this sample, we first run `id` so show that the user is root in the entrypoint
script. Then we `exec gosu nobody ps aux`.

Let's unpack that:

- `exec`
  - this is a shell "built-in" function that continues the current process, but
  as the new command
- `gosu [userspec] [command]`
  - the gosu command steps down from root to the specified user, and then
  runs the command as `exec` does, replacing the gosu process
  - `nobody` is a built-in Debian user
  - `ps aux` lists running processes, including the user and command, so we can
  see what is running in the container (in this case it's just listing itself)

```sh
docker-compose build dockerfile_user

docker-compose run --rm dockerfile_user
```

Sample output:
```
-- Still have root here, could be used for setup --
uid=0(root) gid=0(root) groups=0(root)
--- Giving up root... ---
USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
nobody       1  0.0  0.0   7552  1280 ?        Rs   05:04   0:00 ps aux
```
