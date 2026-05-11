# Rebuild dependencies
mod:
	go mod tidy

# Update dependencies
mod-update:
	go get -u ./...
	go mod tidy

# Lint the code
lint:
	go fmt main.go

# Compile Go packages and dependencies
build:
	CGO_ENABLED=0 GOOS=linux go build -tags netgo -ldflags '-s -w' .
