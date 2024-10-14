#!/bin/bash

# Function to compress video
compress_video() {
    local input_file="$1"
    local extension="${input_file##*.}"  # Get the file extension (e.g., "mp4", "mov")
    local temp_file="${input_file%.*}_compressed.${extension}"  # Create a temporary file with the correct extension

    echo "Compressing: $input_file"

    # Compress the video using ffmpeg, specifying the output format based on the extension
    ffmpeg -i "$input_file" -vcodec libx264 -crf 30 -f "$extension" "$temp_file"

    # Check if the compression was successful
    if [ $? -eq 0 ]; then
        # Replace the original file with the compressed one
        mv "$temp_file" "$input_file"
        echo "Compression successful: $input_file"
    else
        echo "Compression failed: $input_file"
        rm "$temp_file"  # Remove the temporary file if compression failed
    fi
}

# Find all video files recursively and compress them
find . -type f \( -iname "*.mp4" -o -iname "*.mkv" -o -iname "*.avi" -o -iname "*.mov" -o -iname "*.flv" -o -iname "*.wmv" \) | while IFS= read -r file; do
    compress_video "$file"
done

echo "All videos have been processed."
