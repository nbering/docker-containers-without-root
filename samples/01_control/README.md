# Sample: Control

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
