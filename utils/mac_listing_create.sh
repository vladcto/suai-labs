#!/bin/zsh

# Prompt the user for input
read -p "Enter directory path: " directory_path
read -p "Enter file extensions (comma-separated): " file_extensions

# Check if the directory exists
if [ ! -d $directory_path ]; then
  echo "Directory '$directory_path' does not exist."
  exit 1
fi

# Split the file extensions into an array
IFS=',' extensions=($file_extensions)

# Create a temporary file to store the concatenated content
temp_file=$(mktemp)

# Concatenate the content of files with specified extensions, including only the file names
for extension in $extensions; do
  find "$directory_path" -type f -name "*.$extension" -exec sh -c 'echo "\n$(basename $1)"; cat "$1"' _ {} \; >> "$temp_file"
done

# Prompt the user to choose whether to write to a file or copy to the clipboard
read -p "Do you want to (f) write to a result file or (c) copy to the clipboard? (f/c): " choice

if [ "$choice" = "f" ]; then
  read -p "Enter the result file path: " output_file
  # Write the concatenated content to the result file
  cat "$temp_file" > "$output_file"
  echo "Files with extensions $file_extensions in directory '$directory_path' have been written to '$output_file'."
elif [ "$choice" = "c" ]; then
  # Copy the concatenated content to the clipboard
  cat "$temp_file" | pbcopy
  echo "Files with extensions $file_extensions in directory '$directory_path' have been copied to the clipboard."
fi

# Clean up the temporary file
rm "$temp_file"
