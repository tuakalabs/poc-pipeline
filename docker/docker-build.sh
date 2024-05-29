base_dir="../backend/Services"

# Check if the service name argument is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <service_name>"
    exit 1
fi

service_name="$1"
service_dir="$base_dir/$service_name"

# Check if the service directory exists
if [ ! -d "$service_dir" ]; then
    echo "Service directory '$service_dir' does not exist."
    exit 1
fi

# Build the Docker image for the specified service
docker build -t "tuakalabs01/pocapp:$service_name" \
    --build-arg SERVICE_DIR="./backend/Services/$service_name" \
    -f Dockerfile.service \
    .

# docker build -t "tuakalabs01/pocapp:$service_name" \
#     --build-arg SERVICE_DIR="$service_dir" \
#     -f Dockerfile.service \
#     .