# Rebuild dependencies
mod:
	go mod tidy
	go mod vendor

# Update dependencies
mod-update:
	go get -u ./...
	go mod tidy
	go mod vendor

# Lint the code
lint:
	go fmt main.go

# Compile Go packages and dependencies
build:
	CGO_ENABLED=0 GOOS=linux go build -mod=vendor -tags netgo -ldflags '-s -w' .
