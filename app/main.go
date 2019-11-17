package main

import (
	"log"
	"os/user"
)

func main() {
	u, err := user.Current()

	if err != nil {
		log.Panic(err)
	}

	log.Print(u)
}
