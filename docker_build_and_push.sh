echo "Dockerfile modified. Building and pushing Docker image..."

docker build -t okatsn/my-typst-space:latest .

docker push okatsn/my-typst-space:latest

echo "Docker image built and pushed successfully."
