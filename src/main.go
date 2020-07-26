package main

import (
	"fmt"
	"net/http"
	"time"
)

const ServerPort = 8080

func Hello(w http.ResponseWriter, r *http.Request) {

	fmt.Fprintf(w, "[Api] Hello from Makefile example application\n")
	now := time.Now().Format("2006-01-02 15:04:05")
	fmt.Printf("[Http] Time=%s, Path=/, Status=200\n", now)
}

func main() {

	fmt.Printf("[Http] Status=Listening, Port=%d\n", ServerPort)

	http.HandleFunc("/", Hello)
	http.ListenAndServe(fmt.Sprintf(":%d", ServerPort), nil)
}
