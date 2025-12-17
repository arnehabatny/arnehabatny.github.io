#!/bin/bash

# Convert all .png and .jpg files to .webp and delete originals
for f in *.png *.jpg; do
  # Check if the file exists
  [ -e "$f" ] || continue

  # Get the file extension and base name
  ext="${f##*.}"
  base="${f%.*}"

  # Convert to .webp
  cwebp "$f" -o "${base}.webp"

  # Check if the conversion was successful
  if [ $? -eq 0 ]; then
    echo "Converted $f to ${base}.webp"
    rm "$f"
  else
    echo "Failed to convert $f"
  fi
done
