# cleanup deps and download missing ones
.PHONY: deps
deps:
	go mod tidy
	go mod download

# update patch version for dependencies
.PHONY: deps-update
deps-update: deps
	go get -u=patch


# run tests
.PHONY: tests
tests:
	go test -race -cover -count 1 ./...

# run standard go tooling for better readability
.PHONY: tidy
tidy: imports
	go vet ./...
	golint ./...
	go fmt ./...

# format all code with automatic imports
.PHONY: imports
imports:
	find . -type f -name '*.go' -exec goimports -w {} \;
