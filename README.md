# Birdskills

A new Bird project.

## Getting Started

# Build
## Creating a PocketBase Linux build on Mac
`env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o backend_linux`

## Build Flutter
Set backend host and port in `lib/main.dart`

`flutter build web --dart-define SSL=false --dart-define PB_HOST=localhost --dart-define PB_PORT=8090 --web-port=8081`

Or run 
`flutter run --release --dart-define SSL=false --dart-define PB_HOST=localhost --dart-define PB_PORT=8090 --web-port=8081`

## Build Docker image
`docker build --rm -t pocketbase_birdskills ./`

# Run

`sudo docker run -p 8081:8090 pocketbase_birdskills`
`http://localhost:8081/`