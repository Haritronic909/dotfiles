#!/bin/bash

output_text_file="output_text.txt"

prev_text=""

for image in output_frames/*.png; do
    filename=$(basename "$image")
    
    # Extract text from the current frame
    current_text=$(tesseract "$image" -)
    
    # Append text to the output text file if it is different from the previous frame
    if [ "$current_text" != "$prev_text" ]; then
        echo "Frame: $filename" >> "$output_text_file"
        echo "$current_text" >> "$output_text_file"
        echo "" >> "$output_text_file"  # Add a newline for separation
        prev_text="$current_text"
    fi
done

