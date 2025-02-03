#!/bin/bash

input_file="users.txt"

# Process the file starting from the second line
tail -n +2 "$input_file" | while IFS=, read -r name email id; do
    # Trim whitespace from fields using sed
    name=$(echo "$name" | sed 's/^[ \t]*//;s/[ \t]*$//')
    email=$(echo "$email" | sed 's/^[ \t]*//;s/[ \t]*$//')
    id=$(echo "$id" | sed 's/^[ \t]*//;s/[ \t]*$//')

    invalid_email=false
    invalid_id=false

    # Check if the ID is a valid number
    if ! echo "$id" | awk '/^[0-9]+$/ {exit 0} {exit 1}'; then
        invalid_id=true
    fi

    # Check if the email is valid
    if ! echo "$email" | awk '/^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/ {exit 0} {exit 1}'; then
        invalid_email=true
    fi

    # Print warnings if necessary
    if [ "$invalid_id" = true ] && [ "$invalid_email" = true ]; then
        echo "Warning: Invalid ID '$id' and Invalid Email '$email' for user '$name'. Skipping..." >&2
    elif [ "$invalid_id" = true ]; then
        echo "Warning: Invalid ID '$id' for user '$name'. Skipping..." >&2
    elif [ "$invalid_email" = true ]; then
        echo "Warning: Invalid Email '$email' for user '$name'. Skipping..." >&2
    else
        # Determine if the ID is odd or even
        parity=$(echo "$id" | awk '{if ($1 % 2 == 0) print "even"; else print "odd"}')
        echo "The $id of $email is $parity number."
    fi

done
