package main

import (
	"fmt"
	"net/http"
	"os"
)

func main() {
	dbPassword := os.Getenv("DB_PASSWORD")
	apiKey := os.Getenv("API_KEY")
	env := os.Getenv("ENVIRONMENT")

	fmt.Printf("Starting app in %s environment...\n", env)
	fmt.Printf("DB_PASSWORD: %s\n", dbPassword)
	fmt.Printf("API_KEY: %s\n", apiKey)

	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "App is running in %s", env)
	})

	fmt.Println("Server listening on :8080")
	http.ListenAndServe(":8080", nil)
}
