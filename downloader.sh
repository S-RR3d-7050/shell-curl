#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_name>"
    exit 1
fi

# Assign the provided file name to a variable
file_name="$1"

# Check if the file exists
if [ ! -f "$file_name" ]; then
    echo "File $file_name not found."
    exit 1
fi

# Initialize counter
counter=1

# Read each line from the file and download the videos
while IFS= read -r url; do
    echo "Downloading $url..."
    # Download the file and save it with a sequential name
    curl -o "$counter.mp4" "$url"
    ((counter++))
done < "$file_name"

echo "All videos downloaded successfully."

