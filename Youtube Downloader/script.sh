#!/bin/bash

# Check if the file exists
if [ ! -f "videos.txt" ]; then
    echo "File videos.txt not found."
    exit 1
fi

echo "Choose an option:"
echo "1. Download Videos"
echo "2. Download Audios"

read -p "Enter your choice (1 or 2): " choice

if [ "$choice" == "1" ]; then
    echo "Downloading Video Format"

    while IFS= read -r link;
    do
        echo "Working on link : $link"
        yt-dlp -o "downloads/%(title)s.%(ext)s" $link
    done < "videos.txt"
elif [ "$choice" == "2" ]; then
    echo "Downloading Audio Format"

    while IFS= read -r link;
    do
        echo "Working on link : $link"
        yt-dlp -x --audio-format mp3 -o "downloads/%(title)s.%(ext)s" $link
    done < "videos.txt"
else
    echo "Invalid choice please enter either 1 or 2"
fi