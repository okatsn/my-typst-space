echo "Dockerfile modified. Building and pushing Docker image..."

docker build imgtyp .

docker tag imgtyp okatsn/my-typst-space:latest

docker push okatsn/my-typst-space:latest

# Push the same image with the other tag:

# docker tag okatsn/my-typst-space okatsn/my-typst-space:v2025a
# docker push okatsn/my-typst-space:v2025a


echo "Docker image built and pushed successfully."
