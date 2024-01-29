#!/bin/bash

# Check if the file exists
if [ ! -f "videos.txt" ]; then
    echo "File input.txt not found."
    exit 1
fi

while IFS= read -r link;
do
    echo "Working on link : $link"
    yt-dlp -o "downloads/" $link
done < "videos.txt"