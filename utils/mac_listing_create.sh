#!/bin/zsh

read -p "Enter directory path: " directory_path
read -p "Enter file extensions (comma-separated): " file_extensions

if [ ! -d $directory_path ]; then
  echo "Directory '$directory_path' does not exist."
  exit 1
fi

IFS=',' extensions=($file_extensions)

temp_file=$(mktemp)

for extension in $extensions; do
  find "$directory_path" -type f -name "*.$extension" -exec sh -c 'echo "\n$(basename $1)"; cat "$1"' _ {} \; >> "$temp_file"
done

read -p "Do you want to (f) write to a result file or (c) copy to the clipboard? (f/c): " choice

if [ "$choice" = "f" ]; then
  read -p "Enter the result file path: " output_file
  cat "$temp_file" > "$output_file"
  echo "Files with extensions $file_extensions in directory '$directory_path' have been written to '$output_file'."
elif [ "$choice" = "c" ]; then
  cat "$temp_file" | pbcopy
  echo "Files with extensions $file_extensions in directory '$directory_path' have been copied to the clipboard."
fi

rm "$temp_file"
