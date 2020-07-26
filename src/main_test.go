package main

import (
	"net/http"
	"net/http/httptest"
	"testing"
)

func TestHello(t *testing.T) {

	req, err := http.NewRequest("GET", "makefile:8080", nil)
	if err != nil {
		t.Fatal(err)
	}

	rr := httptest.NewRecorder()
	handler := http.HandlerFunc(Hello)

	handler.ServeHTTP(rr, req)

	if status := rr.Code; status != http.StatusOK {
		t.Errorf("handler returned wrong status code: got %v want %v",
			status, http.StatusOK)
	}
}
